class Question

    attr_accessor :title, :body, :user_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def self.find_by_id(search_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, search_id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
            SQL
        return nil unless question.length > 0

        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                user_id = ?
            SQL
        return nil unless questions.length > 0

        questions.map { |q| Question.new(q) }
    end

    def author
        author = QuestionsDatabase.instance.execute(<<-SQL, @user_id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
            SQL
        return nil unless author.length > 0

        User.new(author.first)
    end

    def replies
        replies = Reply.find_by_question_id(@id)
    end

    def followers
        QuestionFollow.followers_for_question_id(@id)
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def likers
        QuestionLike.likers_for_question_id(@id)
    end

    def num_likes
        QuestionLike.num_likes_for_question_id(@id)
    end

    def save
        if @id.nil?
            QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
                INSERT INTO
                    questions (title, body, user_id)
                VALUES
                    (?, ?, ?)
            SQL

            @id = QuestionsDatabase.instance.last_insert_row_id
        else
            QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
                UPDATE
                    questions
                SET
                    title = ?, body = ?, user_id = ?
                WHERE
                    id = ?
            SQL
        end
    end
end