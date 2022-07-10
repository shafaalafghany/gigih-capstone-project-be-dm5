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

ActiveRecord::Schema[7.0].define(version: 2022_07_10_042157) do
  create_table "distribusis", force: :cascade do |t|
    t.datetime "tanggal"
    t.integer "jumlah"
    t.integer "petuga_id"
    t.integer "logistik_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["logistik_id"], name: "index_distribusis_on_logistik_id"
    t.index ["petuga_id"], name: "index_distribusis_on_petuga_id"
  end

  create_table "kejadians", force: :cascade do |t|
    t.datetime "tanggal"
    t.string "kejadian"
    t.string "deskripsi_kejadian"
    t.string "lokasi"
    t.integer "pelapor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["pelapor_id"], name: "index_kejadians_on_pelapor_id"
  end

  create_table "kerusakans", force: :cascade do |t|
    t.string "kerusakan"
    t.string "kerugian"
    t.string "keterangan"
    t.integer "kejadian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kejadian_id"], name: "index_kerusakans_on_kejadian_id"
  end

  create_table "logistiks", force: :cascade do |t|
    t.string "jenis_bantuan"
    t.string "nama_barang"
    t.string "jumlah"
    t.datetime "tanggal_distribusi"
    t.integer "penerima_id"
    t.integer "petuga_id"
    t.integer "kejadian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kejadian_id"], name: "index_logistiks_on_kejadian_id"
    t.index ["penerima_id"], name: "index_logistiks_on_penerima_id"
    t.index ["petuga_id"], name: "index_logistiks_on_petuga_id"
  end

  create_table "pegawais", force: :cascade do |t|
    t.string "nik"
    t.string "nama"
    t.string "tempat_lahir"
    t.date "tanggal_lahir"
    t.string "jk"
    t.string "alamat"
    t.string "telp"
    t.string "jabatan"
    t.integer "status"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pegawais_on_user_id"
  end

  create_table "pelapors", force: :cascade do |t|
    t.string "nama"
    t.string "nik"
    t.string "telp"
    t.string "tempat_lahir"
    t.date "tanggal_lahir"
    t.datetime "tanggal"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pelapors_on_user_id"
  end

  create_table "penanggulangans", force: :cascade do |t|
    t.datetime "tanggal"
    t.string "penanggulangan"
    t.string "lokasi"
    t.integer "petuga_id"
    t.integer "kejadian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kejadian_id"], name: "index_penanggulangans_on_kejadian_id"
    t.index ["petuga_id"], name: "index_penanggulangans_on_petuga_id"
  end

  create_table "penerimas", force: :cascade do |t|
    t.datetime "tanggal"
    t.string "nama"
    t.string "tempat_lahir"
    t.date "tanggal_lahir"
    t.string "jk"
    t.string "telp"
    t.integer "pelapor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pelapor_id"], name: "index_penerimas_on_pelapor_id"
  end

  create_table "petugas", force: :cascade do |t|
    t.string "telp"
    t.string "nama"
    t.string "tempat_lahir"
    t.date "tanggal_lahir"
    t.string "alamat"
    t.string "bagian"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poskos", force: :cascade do |t|
    t.string "nama"
    t.string "lokasi"
    t.integer "kapasitas"
    t.string "penanggung_jawab"
    t.integer "kejadian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kejadian_id"], name: "index_poskos_on_kejadian_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nama"
    t.string "username"
    t.string "password_digest"
    t.string "telp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
