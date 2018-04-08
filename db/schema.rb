# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180129004427) do

  create_table "bible_versions", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "This is the general translation information and db links" do |t|
    t.text "table", null: false, comment: "Database Table Name "
    t.text "abbreviation", null: false, comment: "Version Abbreviation"
    t.text "language", null: false, comment: "Language of bible translation (used for language key tables)"
    t.text "version", null: false, comment: "Version Name"
    t.text "info_text", null: false, comment: "About / Info"
    t.text "info_url", null: false, comment: "Info URL"
    t.text "publisher", null: false, comment: "Publisher"
    t.text "copyright", null: false, comment: "Copyright "
    t.text "copyright_info", null: false, comment: "Extended Copyright info"
  end

  create_table "book_abbreviations", id: :integer, limit: 2, comment: "Abbreviation ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "A table mapping book abbreviations to the book they refer to" do |t|
    t.string "name", default: "", null: false
    t.integer "book_id", limit: 2, null: false, comment: "ID of book that is abbreviated", unsigned: true
    t.boolean "primary", default: false, null: false, comment: "Whether an abbreviation is the primary one for the book"
  end

  create_table "books", id: :integer, comment: "Book #", default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "name", null: false, comment: "Name"
    t.string "testament", limit: 2, default: "", null: false, comment: "Which Testament this book is in"
    t.integer "genre_id", limit: 1, null: false, comment: "A genre ID to identify the type of book this is", unsigned: true
  end

  create_table "genres", id: :integer, limit: 1, comment: "Genre ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Table mapping genre IDs to genre names for book table lookup" do |t|
    t.string "name", default: "", null: false, comment: "Name of genre"
  end

  create_table "t_asv", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "book_id", null: false
    t.integer "chapter", null: false
    t.integer "verse", null: false
    t.text "text", null: false
    t.index ["id"], name: "id"
    t.index ["id"], name: "id_2"
    t.index ["id"], name: "id_3", unique: true
    t.index ["id"], name: "id_4"
    t.index ["id"], name: "id_5"
    t.index ["id"], name: "id_6"
    t.index ["id"], name: "id_7"
    t.index ["id"], name: "id_8"
  end

  create_table "t_bbe", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "b", null: false
    t.integer "c", null: false
    t.integer "v", null: false
    t.text "t", null: false
    t.index ["id"], name: "id", unique: true
    t.index ["id"], name: "id_2"
  end

  create_table "t_dby", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "b", null: false
    t.integer "c", null: false
    t.integer "v", null: false
    t.text "t", null: false
    t.index ["id"], name: "id", unique: true
    t.index ["id"], name: "id_2", unique: true
  end

  create_table "t_kjv", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "b", null: false
    t.integer "c", null: false
    t.integer "v", null: false
    t.text "t", null: false
    t.index ["id"], name: "id"
    t.index ["id"], name: "id_2", unique: true
  end

  create_table "t_wbt", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", null: false, unsigned: true
    t.integer "b", null: false
    t.integer "c", null: false
    t.integer "v", null: false
    t.text "t", null: false
  end

  create_table "t_web", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "b", null: false
    t.integer "c", null: false
    t.integer "v", null: false
    t.text "t", null: false
    t.index ["id"], name: "id"
    t.index ["id"], name: "id_2", unique: true
  end

  create_table "t_ylt", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "b", null: false
    t.integer "c", null: false
    t.integer "v", null: false
    t.text "t", null: false
    t.index ["id"], name: "id"
    t.index ["id"], name: "id_2", unique: true
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "display_name"
    t.string "email"
    t.string "image"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
