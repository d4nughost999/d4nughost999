#!/bin/bash
# Script multi-section HTML generator dengan warna custom
# Author: d4nu-ghost

HTML_FILE="multisection.html"

clear
echo "=============================="
echo "🌐 PEMBUAT HTML MULTI-SECTION (Custom Warna)"
echo "=============================="

# Input data awal
read -p "Masukkan Judul Halaman: " JUDUL
read -p "Masukkan Warna Background (contoh: black, white, #007acc): " BG
read -p "Masukkan Warna Judul Utama (contoh: red, yellow, #ff6600): " WARNA_JUDUL
read -p "Masukkan Warna Sub Judul: " WARNA_SUB
read -p "Masukkan Warna Paragraf: " WARNA_PARAGRAF

# Buat file HTML dasar
cat > $HTML_FILE <<EOF
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>$JUDUL</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background: $BG; padding: 20px; }
        .card { border: 2px solid #333; border-radius: 10px; padding: 20px; margin: 20px auto; background: white; width: 80%; max-width: 800px; }
        h1 { color: $WARNA_JUDUL; }
        h2 { color: $WARNA_SUB; }
        p { font-size: 16px; text-align: left; color: $WARNA_PARAGRAF; }
        img { max-width: 300px; margin: 10px 0; }
    </style>
</head>
<body>
    <h1>$JUDUL</h1>
EOF

# Tambah section dinamis
while true; do
    echo ""
    echo "=== Tambah Section Baru ==="
    echo "1. Judul Kecil"
    echo "2. Paragraf"
    echo "3. Gambar"
    echo "4. Selesai"
    read -p "Pilih (1-4): " PILIH

    case $PILIH in
        1)
            read -p "Masukkan Judul Kecil: " SUBJUDUL
            echo "    <div class=\"card\"><h2>$SUBJUDUL</h2>" >> $HTML_FILE
            ;;
        2)
            read -p "Masukkan Paragraf: " PARAGRAF
            echo "    <p>$PARAGRAF</p>" >> $HTML_FILE
            ;;
        3)
            read -p "Masukkan URL/Path Gambar: " GAMBAR
            echo "    <img src=\"$GAMBAR\" alt=\"Gambar\">" >> $HTML_FILE
            ;;
        4)
            echo "    <p><b>Author: d4nu-ghost</b></p></div>" >> $HTML_FILE
            break
            ;;
        *)
            echo "❌ Pilihan tidak valid."
            ;;
    esac
done

# Tutup HTML
cat >> $HTML_FILE <<EOF
</body>
</html>
EOF

echo "✅ HTML multi-section berhasil dibuat → $HTML_FILE"
echo "Ketik: termux-open $HTML_FILE untuk buka di browser."
