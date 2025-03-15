#!/bin/bash

FILE=$1

help_sir() {
cat <<EOF

       ᕱ    waddles*⠀⠀⣠⣠⣶⣿⣷⣿⣿⣿⣷⣷⣶⣤⣀⠀⠀⠀⠀⠀⠀⭑⠀⠀⠀⠀⠀
 ⭑              ⠀⠀⠀ ⣤⣾⣿⢿⣻⡽⣞⣳⡽⠚⠉⠉⠙⠛⢿⣶⣄⠀⠀ ⠀⠀⠀⠀⠀⠀⠀ hello! (˶ᵔ ᵕ ᵔ˶)
⠀         ⭑       ⠀⣼⣿⣿⢻⣟⣧⢿⣻⢿⠀⠀⠀⠀⠀⠀⠀⠻⣿⣧⠀⠀ ⠀⠀⠀⭑⠀⠀ my name is piplup!
⠀  𐪜             ⢀⣾⣿⡿⠞⠛⠚⠫⣟⡿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣧⠀⠀⠀⠀⠀⠀⠀
⠀               ⠀⣼⣿⡟⠀⠀⠀⠀⠀⠈⢻⡽⣆⠀⠀⣴⣷⡄⠀⠀⠀⠘⣿⡆⠀⠀⣀⣠⣤⡄                ⭑
⠀       ⭑        ⣿⣿⠁⠀⠀⠀⠀⠀⠀⠈⣿⠿⢷⡀⠘⠛⠃⠀⠀⠀⠀⣿⣅⣴⡶⠟⠋⢹⣿       ʬʬ
⠀ ⭑             ⠀⢻⣿⡀⠀⠀⠀⣾⣿⡆⠀⢿⣴⣴⡇⠀⠀⠀⠀⠀⠀⢠⡟⠋⠁⠀⠀⠀⢸⣿
⠀⠀               ⠈⢿⣇⠀⠀⠀⠀⠉⠁⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⠀⠀⠀⣾⡏   ⭑
⠀⠀⠀      ٪        ⠈⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢸⠁⠀⠀⠀⠀⠀⣼⡟⠀           ⭑
⠀⠀⠀⠀               ⠀⣹⣿⣶⣤⣀⡀⠀⠀⠀⠀⠀⣀⠀⠀⠂⠁⠀⠐⢧⡀⠀⢀⣾⠟⠀⠀               ⁇
⠀⠀ ⭑         ⭑   ⢀⣰⣾⠟⠉⠀⠀⠉⠉⠀⠐⠂⠀⠁⠁⠀⠀⠀⠀⠀⠀⠈⢿⣶⡟⠋⠀⠀⠀       ⭑
               ⣠⣶⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⡆⠀⠀⠀⠀ ⭑
         ⭑     ⢻⣧⣄⠀⠀⠀⢰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀ ⠀           ⭑
    ⁉          ⠀⠉⠛⠿⣷⣶⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀               ⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⣾⣿⠀⠀⠀⠀   𑊂    ⭑
⠀⭑⠀⠀⠀⠀    ⭑         ⠀⢹⣿⣿⣿⣿⣷⣦⡀⠀⢀⣀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣷⠀⠀  ⠀⠀            ⭑
⠀            ⁈  ⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⠿⠿⣿⣿⣿⠿⠟⠁⠀⠀⠀⠀ ⭑                 ǃ
     ⭑            ⭑                                  ⭑
ㅤ :¨·.·¨:         .˳⁺⁎˚ ꒰ఎ help ໒ ꒱ ˚⁎⁺˳ .           ￨𐑘__/,￨（｀＼
ㅤ  ˋ·.ꔫ ˊ                                            _.￨o o  ￨_ ）  ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
/ ❦ . . ꒰Format: $0 <nama file> <perintah> [opsi tambahan] ꒱
/ ❦ . . ꒰Perintah ꒱
꒰-h / --help ꒱	Tampilin menu bantuan (ini).
꒰-i / --info ꒱	Lihat Pokemon dengan pick rate dan total pick tertinggi.
꒰-s / --sort ꒱	Urutin data sesuai kategori yang dipilih.
  ୨♡୧ ... name		Urut berdasarkan nama Pokemon.
  ୨♡୧ ... usage		Urut berdasarkan pick rate Pokemon (% kepake).
  ୨♡୧ ... raw		Urut berdasarkan total pick Pokemon (berapa kali dipilih).
  ୨♡୧ ... hp		Urut berdasarkan HP.
  ୨♡୧ ... atk		Urut berdasarkan serangan.
  ୨♡୧ ... def		Urut berdasarkan pertahanan.
  ୨♡୧ ... spatk		Urut berdasarkan serangan spesial.
  ୨♡୧ ... spdef		Urut berdasarkan pertahanan spesial.
  ୨♡୧ ... speed		Urut berdasarkan kecepatan.
꒰-g / --grep ꒱	Cari Pokemon tertentu (otomatis urut berdasarkan pick rate).
꒰-f / --filter ꒱	Filter Pokemon berdasarkan tipe (otomatis urut berdasarkan pick rate).

EOF
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then help_sir; exit 0; fi
if [ ! -f "$FILE" ]; then
cat <<EOF

ㅤ :¨·.·¨:         .˳⁺⁎˚ ꒰ఎ error ໒ ꒱ ˚⁎⁺˳ .          ￨𐑘__/,￨（｀＼
ㅤ  ˋ·.ꔫ ˊ                                            _.￨o o  ￨_ ）  ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
  ୨♡୧ ... File-nya gaada, sir.

EOF
exit 1
elif [ $# -lt 2 ]; then
cat <<EOF

ㅤ :¨·.·¨:         .˳⁺⁎˚ ꒰ఎ error ໒ ꒱ ˚⁎⁺˳ .          ￨𐑘__/,￨（｀＼
ㅤ  ˋ·.ꔫ ˊ                                            _.￨o o  ￨_ ）  ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
/ ❦ . . ꒰Format: $0 <nama file> <perintah> [opsi tambahan] ꒱
  ୨♡୧ ... Kalo masih bingung bisa ketik -h atau --help ya, sir.

EOF
exit 1
fi

summary() {
highest_usage=$(awk 'BEGIN {FS=","} NR>1 {if($2+0>max1) {max1=$2+0; name1=$1}} END {print name1 " dengan " max1 "%"}' "$FILE")
highest_raw=$(awk 'BEGIN {FS=","} NR>1 {if($3+0>max2) {max2=$3+0; name2=$1}} END {print name2 " dengan " max2 " kali"}' "$FILE")
cat <<EOF

ㅤ :¨·.·¨:         .˳⁺⁎˚ ꒰ఎ info ໒ ꒱ ˚⁎⁺˳ .           ￨𐑘__/,￨（｀＼
ㅤ  ˋ·.ꔫ ˊ                                            _.￨o o  ￨_ ）  ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
EOF
echo "/ ❦ . . ꒰Pick Rate tertinggi	: $highest_usage	꒱"
echo "/ ❦ . . ꒰Total Pick Tertinggi	: $highest_raw	꒱"
echo
}

sortt() {
cat <<EOF

ㅤ :¨·.·¨:         .˳⁺⁎˚ ꒰ఎ sort ໒ ꒱ ˚⁎⁺˳ .           ￨𐑘__/,￨（｀＼
ㅤ  ˋ·.ꔫ ˊ                                            _.￨o o  ￨_ ）  ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
EOF
column=$1
case "$column" in
name) col=1 ;;
usage) col=2 ;;
raw) col=3 ;;
hp) col=6 ;;
atk) col=7 ;;
def) col=8 ;;
spatk) col=9 ;;
spdef) col=10 ;;
speed) col=11 ;;
*) echo "  ୨♡୧ ... Error: Gak ada opsinya, sir. Cek di -h atau --help coba.";
echo;
exit 1 ;;
esac
echo "$(head -1 "$FILE")" && tail -n +2 "$FILE" | sort -t',' -k"$col","$col"nr
echo
}

search_nama() {
cat <<EOF

ㅤ :¨·.·¨:         .˳⁺⁎˚ ꒰ఎ grep ໒ ꒱ ˚⁎⁺˳ .           ￨𐑘__/,￨（｀＼
ㅤ  ˋ·.ꔫ ˊ                                            _.￨o o  ￨_ ）  ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
EOF
header=$(head -1 "$FILE")
result_nama=$(awk -F',' -v name="$1" 'NR>1 && index(tolower($1), tolower(name))' "$FILE" | sort -t',' -k2,2nr)
if [ -n "$result_nama" ]; then
echo "$header"
echo "$result_nama"
echo
exit 1
else
echo "  ୨♡୧ ... Error: Gak ada yang namanya kaya gitu, sir." >&2
echo
fi
}

search_type() {
cat <<EOF

ㅤ :¨·.·¨:        .˳⁺⁎˚ ꒰ఎ filter ໒ ꒱ ˚⁎⁺˳ .          ￨𐑘__/,￨（｀＼
ㅤ  ˋ·.ꔫ ˊ                                            _.￨o o  ￨_ ）  ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
EOF
header=$(head -1 "$FILE")
result_type=$(awk -F',' -v type="$1" 'NR>1 && tolower($4)==tolower(type) || tolower($5)==tolower(type)' "$FILE" | sort -t',' -k2,2nr)

if [ -n "$result_type" ]; then
echo "$header"
echo "$result_type"
echo
exit 1
else
echo "  ୨♡୧ ... Error: Gak ada tipenya, sir." >&2
echo
fi
}

case "$2" in
-i|--info) summary ;;
-s|--sort) sortt "$3" ;;
-g|--grep) search_nama "$3" ;;
-f|--filter) search_type "$3" ;;
*) cat <<EOF

ㅤ :¨·.·¨:         .˳⁺⁎˚ ꒰ఎ error ໒ ꒱ ˚⁎⁺˳ .          ￨𐑘__/,￨（｀＼
ㅤ  ˋ·.ꔫ ˊ                                            _.￨o o  ￨_ ）  ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
  ୨♡୧ ... Error: Gak ada perintah kaya gitu, sir. Cek di -h atau --help coba.

EOF
exit 1 ;;
esac
