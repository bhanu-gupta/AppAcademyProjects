class Reply

    attr_accessor :question_id, :parent_id, :user_id, :body

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @user_id = options['user_id']
        @body = options['body']
    end

    def self.find_by_id(search_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, search_id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
            SQL
        return nil unless reply.length > 0

        Reply.new(reply.first)
    end

    def self.find_by_user_id(user_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
            SQL
        return nil unless replies.length > 0

        replies.map { |r| Reply.new(r) }
    end


    def self.find_by_question_id(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
            SQL
        return nil unless replies.length > 0

        replies.map { |r| Reply.new(r) }
    end

    def author
        User.find_by_id(@user_id)
    end

    def question
        Question.find_by_id(@question_id)
    end

    def parent_reply
        Reply.find_by_id(@parent_id)
    end

    def child_replies
        replies = QuestionsDatabase.instance.execute(<<-SQL, @id, @question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_id = ? AND
                question_id = ?
            SQL

        replies.map { |r| Reply.new(r) }
    end

    def save
        if @id.nil?
            QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @body)
                INSERT INTO
                    replies (question_id, parent_id, user_id, body)
                VALUES
                    (?, ?, ?, ?)
            SQL

            @id = QuestionsDatabase.instance.last_insert_row_id
        else
            QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @body, @id)
                UPDATE
                    replies
                SET
                    question_id = ?, parent_id = ?, user_id = ?, body = ?
                WHERE
                    id = ?
            SQL
        end
    end
end
