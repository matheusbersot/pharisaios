# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150811140602) do

  create_table "agencias", force: :cascade do |t|
    t.string   "nome"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agencias_moeda", force: :cascade do |t|
    t.integer  "agencia_id"
    t.integer  "moeda_id"
    t.float    "valor"
    t.date     "dtUltimaAtualizacao"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "agencias_moeda", ["agencia_id"], name: "index_agencias_moeda_on_agencia_id"
  add_index "agencias_moeda", ["moeda_id"], name: "index_agencias_moeda_on_moeda_id"

  create_table "moedas", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
