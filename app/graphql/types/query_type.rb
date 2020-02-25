module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, UserType, null: true do
      description 'Find a user by ID'
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :users, [UserType], null: true do
      description 'Find All users'
      argument :last, Integer, required: false
    end

    def users(last:)
      last ? User.last(last) : User.all
    end

    field :webgl_examples, [WebglExampleType], null: true do
      description 'Find All WebGL Examples'
      argument :last, Integer, required: false
    end

    def webgl_examples(last:)
      last ? WebglExample.last(last) : WebglExample.all
    end

    field :webgl_example, WebglExampleType, null: false do
      description 'Find a WebGL Examples by ID'
      argument :id, ID, required: true
    end

    def webgl_example(id:)
      WebglExample.find(id)
    end

    field :articles, [ArticleType], null: true do
      description 'Find All Articles'
      argument :last, Integer, required: false
    end

    def articles(last: )
      results = []
      base_url = "/Users/lele88lala/articles"
      Dir.each_child(base_url) do |x|
        puts "Got #{x}"
        if x.match(/.md/)
          content = File.readlines("#{base_url}/#{x}")
          ctime = File.ctime("#{base_url}/#{x}")

          title = content[0].gsub("\n",'')
          if title.match(/<h[0-9]>/)
            title = title[/<h[0-9]>(.*?)<\/h[0-9]>/, 1]
          end
          if title.match(/\#{1,}\s/)
            title = title[/\#{1,}\s(.*)/, 1]
          end

          results.push({
            title: title,
            content: content.join,
            created_at: ctime,
          })
          puts content
        end
      end
      results
    end
  end
end
