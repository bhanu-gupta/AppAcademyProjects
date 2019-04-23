class User

    attr_accessor :fname, :lname

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_id(search_id)
        user = QuestionsDatabase.instance.execute(<<-SQL, search_id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
            SQL
        return nil unless user.length > 0

        User.new(user.first)
    end

    def self.find_by_name(fname, lname)
        users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND 
                lname = ?
            SQL
        return nil unless users.length > 0

        users.map { |u| User.new(u)}
    end

    def authored_questions
        questions = Question.find_by_author_id(@id)
    end

    def authored_replies
        replies = Reply.find_by_user_id(@id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(@id)
    end

    def liked_questions
        QuestionLike.liked_questions_for_user_id(@id)
    end

    def average_karma
        average = QuestionsDatabase.instance.execute(<<-SQL, @id)
            select 
                CAST(COUNT(question_likes.id) AS FLOAT)/COUNT(DISTINCT(questions.id)) AS avg
            FROM questions 
            LEFT OUTER JOIN question_likes 
                ON questions.id = question_likes.question_id 
            WHERE questions.user_id = ? 
            SQL
        return average.first["avg"]
    end

    def save
        if @id.nil?
            QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
                INSERT INTO
                    users (fname, lname)
                VALUES
                    (?, ?)
            SQL

            @id = QuestionsDatabase.instance.last_insert_row_id
        else
            QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
                UPDATE
                    users
                SET
                    fname = ?, lname = ?
                WHERE
                    id = ?
            SQL
        end
    end
end
