require 'recipes_repository'

RSpec.describe RecipeRepository do
    def reset_recipes_table
        seed_sql = File.read('spec/seeds_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
        connection.exec(seed_sql)
        end

    describe RecipeRepository do
        before(:each) do
        reset_recipes_table
        end

        it "returns two recipes" do
            repo = RecipeRepository.new
            recipes = repo.all
            expect(recipes.length).to eq 2
            expect(recipes.first.name).to eq ('Jerk Chicken')
            expect(recipes.first.cooking_time_min).to eq '55'
            expect(recipes.first.rating).to eq '5'
        end
    end
end
