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

        it "returns a single recipe" do
            repo = RecipeRepository.new
            recipes = repo.find(1)
            
            expect(recipes.name).to eq ('Jerk Chicken')
            expect(recipes.cooking_time_min).to eq '55'
            expect(recipes.rating).to eq '5'
        end

         it "returns the recipe curry goat" do
            repo = RecipeRepository.new
            recipes = repo.find(2)
            
            expect(recipes.name).to eq ('Curry Goat with Rice and Peas')
            expect(recipes.cooking_time_min).to eq '210'
            expect(recipes.rating).to eq '4'
         end
    end
end
