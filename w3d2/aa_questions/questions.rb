require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

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
end

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
end

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
end

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
end

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
end