class QuestionLike

    attr_accessor :question_id, :user_id

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

    def self.find_by_id(search_id)
        ques_like = QuestionsDatabase.instance.execute(<<-SQL, search_id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
            SQL
        return nil unless ques_like.length > 0

        QuestionLike.new(ques_like.first)
    end

    def self.likers_for_question_id(question_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                users.*
            FROM
                users
            JOIN 
                question_likes ON question_likes.user_id = users.id
            WHERE
                question_id = ?
            SQL
        return nil unless users.length > 0

        users.map { |u| User.new(u) }
    end

    def self.num_likes_for_question_id(question_id)
        num = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                count(*) AS num
            FROM
                users
            JOIN 
                question_likes ON question_likes.user_id = users.id
            WHERE
                question_id = ?
            SQL

        return num.first["num"]
        # SELECT * FROM users JOIN question_likes ON question_likes.user_id = users.id WHERE question_id = 1;
    end

    def self.liked_questions_for_user_id(user_id)
        ques = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                questions.*
            FROM
                questions
            JOIN 
                question_likes ON question_likes.question_id = questions.id
            WHERE
                question_likes.user_id = ?
            SQL
        return nil unless ques.length > 0

        ques.map { |q| Question.new(q) }
    end

    def self.most_liked_questions(n)
        ques = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                questions.*
            FROM
                questions
            JOIN 
                question_likes ON question_likes.question_id = questions.id
            GROUP BY
                question_id
            ORDER BY
                COUNT(*) DESC
            LIMIT
                ?
            SQL
        return nil unless ques.length > 0

        ques.map { |q| Question.new(q) }
    end
end