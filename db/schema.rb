# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_07_103201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crises", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "days", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "comment"
    t.date "date"
    t.integer "pain_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "energykj", default: 0
    t.integer "energykcal", default: 0
    t.integer "energyfibrekj", default: 0
    t.integer "energyfibrekcal", default: 0
    t.integer "eau", default: 0
    t.integer "proteinesjones", default: 0
    t.integer "proteines", default: 0
    t.integer "glucides", default: 0
    t.integer "lipides", default: 0
    t.integer "sucres", default: 0
    t.integer "fructose", default: 0
    t.integer "galactos", default: 0
    t.integer "glucose", default: 0
    t.integer "lactose", default: 0
    t.integer "maltose", default: 0
    t.integer "saccharose", default: 0
    t.integer "amidon", default: 0
    t.integer "fibres", default: 0
    t.integer "polyols", default: 0
    t.integer "cendres", default: 0
    t.integer "alcool", default: 0
    t.integer "acideorganiques", default: 0
    t.integer "agsatures", default: 0
    t.integer "agmonoinsature", default: 0
    t.integer "agpolyinsature", default: 0
    t.integer "agbutyrique", default: 0
    t.integer "agcaproique", default: 0
    t.integer "agcaprylique", default: 0
    t.integer "agcaprique", default: 0
    t.integer "aglaurique", default: 0
    t.integer "agmyristique", default: 0
    t.integer "agpalmitique", default: 0
    t.integer "agstearique", default: 0
    t.integer "agoleique", default: 0
    t.integer "aglinoeique", default: 0
    t.integer "agalphalinolenique", default: 0
    t.integer "agarachidoneique", default: 0
    t.integer "ageap", default: 0
    t.integer "agdha", default: 0
    t.integer "cholesterole", default: 0
    t.integer "sel", default: 0
    t.integer "calcium", default: 0
    t.integer "chlorure", default: 0
    t.integer "cuivre", default: 0
    t.integer "fer", default: 0
    t.integer "iode", default: 0
    t.integer "magnesium", default: 0
    t.integer "manganese", default: 0
    t.integer "phosphore", default: 0
    t.integer "potassium", default: 0
    t.integer "selenium", default: 0
    t.integer "sodium", default: 0
    t.integer "zinc", default: 0
    t.integer "retinol", default: 0
    t.integer "betacarotene", default: 0
    t.integer "vitamineD", default: 0
    t.integer "vitamineE", default: 0
    t.integer "vitamineK1", default: 0
    t.integer "vitamineK2", default: 0
    t.integer "vitamineC", default: 0
    t.integer "vitamineB1", default: 0
    t.integer "vitamineB2", default: 0
    t.integer "vitamineB3", default: 0
    t.integer "vitamineB5", default: 0
    t.integer "vitamineB6", default: 0
    t.integer "vitamineB9", default: 0
    t.integer "vitamineB12", default: 0
    t.bigint "crisis_id"
    t.index ["crisis_id"], name: "index_days_on_crisis_id"
    t.index ["user_id"], name: "index_days_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "group1"
    t.string "group2"
    t.string "group3"
    t.string "code"
    t.string "name"
    t.float "energykj"
    t.float "energykcal"
    t.float "energyfibrekj"
    t.float "energyfibrekcal"
    t.float "eau"
    t.float "proteinesjones"
    t.float "proteines"
    t.float "glucides"
    t.float "lipides"
    t.float "sucres"
    t.float "fructose"
    t.float "galactos"
    t.float "glucose"
    t.float "lactose"
    t.float "maltose"
    t.float "saccharose"
    t.float "amidon"
    t.float "fibres"
    t.float "polyols"
    t.float "cendres"
    t.float "alcool"
    t.float "acideorganiques"
    t.float "agsatures"
    t.float "agmonoinsature"
    t.float "agpolyinsature"
    t.float "agbutyrique"
    t.float "agcaproique"
    t.float "agcaprylique"
    t.float "agcaprique"
    t.float "aglaurique"
    t.float "agmyristique"
    t.float "agpalmitique"
    t.float "agstearique"
    t.float "agoleique"
    t.float "aglinoeique"
    t.float "agalphalinolenique"
    t.float "agarachidoneique"
    t.float "ageap"
    t.float "agdha"
    t.float "cholesterole"
    t.float "sel"
    t.float "calcium"
    t.float "chlorure"
    t.float "cuivre"
    t.float "fer"
    t.float "iode"
    t.float "magnesium"
    t.float "manganese"
    t.float "phosphore"
    t.float "potassium"
    t.float "selenium"
    t.float "sodium"
    t.float "zinc"
    t.float "retinol"
    t.float "betacarotene"
    t.float "vitamineD"
    t.float "vitamineE"
    t.float "vitamineK1"
    t.float "vitamineK2"
    t.float "vitamineC"
    t.float "vitamineB1"
    t.float "vitamineB2"
    t.float "vitamineB3"
    t.float "vitamineB5"
    t.float "vitamineB6"
    t.float "vitamineB9"
    t.float "vitamineB12"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meal_ingredients", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "meal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "quantity"
    t.index ["ingredient_id"], name: "index_meal_ingredients_on_ingredient_id"
    t.index ["meal_id"], name: "index_meal_ingredients_on_meal_id"
  end

  create_table "meal_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meals", force: :cascade do |t|
    t.bigint "meal_type_id", null: false
    t.bigint "day_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_meals_on_day_id"
    t.index ["meal_type_id"], name: "index_meals_on_meal_type_id"
  end

  create_table "poohs", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.boolean "blood"
    t.integer "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_poohs_on_day_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unity"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "preference_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["preference_id"], name: "index_user_preferences_on_preference_id"
    t.index ["user_id"], name: "index_user_preferences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "birthday"
    t.string "nickname"
    t.string "sex"
    t.integer "weight"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "days", "crises"
  add_foreign_key "days", "users"
  add_foreign_key "meal_ingredients", "ingredients"
  add_foreign_key "meal_ingredients", "meals"
  add_foreign_key "meals", "days"
  add_foreign_key "meals", "meal_types"
  add_foreign_key "poohs", "days"
  add_foreign_key "user_preferences", "preferences"
  add_foreign_key "user_preferences", "users"
end
