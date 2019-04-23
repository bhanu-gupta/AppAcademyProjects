class QuestionFollow

    attr_accessor :question_id, :user_id

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

    def self.find_by_id(search_id)
        ques_follow = QuestionsDatabase.instance.execute(<<-SQL, search_id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
            SQL
        return nil unless ques_follow.length > 0

        QuestionFollow.new(ques_follow.first)
    end

    def self.followers_for_question_id(question_id)
        ques_follow = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                users.*
            FROM
                users
            JOIN question_follows ON users.id = question_follows.user_id
            WHERE
                question_follows.question_id = ?
            SQL
        return nil unless ques_follow.length > 0

        ques_follow.map { |qf| User.new(qf) }
    end

    def self.followed_questions_for_user_id(user_id)
        ques = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                questions.*
            FROM
                questions
            JOIN question_follows ON questions.id = question_follows.question_id
            WHERE
                question_follows.user_id = ?
            SQL
        return nil unless ques.length > 0

        ques.map { |q| Question.new(q) }
    end

    def self.most_followed_questions(n)
        ques = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                questions.*
            FROM
                questions
            JOIN question_follows ON questions.id = question_follows.question_id
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