# Shift Modul 1 - IT04

Kelompok IT04
| Nama                                | NRP         |
|-------------------------------------|-------------|
| Raya Ahmad Syarif                   | 5027241041  |
| Salsa Bil Ulla                      | 5027241052  |
| Adinda Cahya Pramesti               | 5027241117  |


## Ketentuan
Struktur Repository Seperti Berikut:
```
—soal_1:
  	— popposiroyo.sh

—soal_2:
  	├── login.sh
	├── register.sh
	├── scripts/
	│   ├── core_monitor.sh
	│   ├── frag_monitor.sh
	│   └── manager.sh
	└── terminal.sh


—soal_3:
  	— dsotm.sh

—soal_4:
  	— pokemon_analysis.sh

```

## Soal 1

Di sebuah desa kecil yang dikelilingi bukit hijau, Poppo dan Siroyo, dua sahabat karib, sering duduk di bawah pohon tua sambil membayangkan petualangan besar. Poppo, yang ceria dan penuh semangat, baru menemukan kesenangan dalam dunia buku, sementara Siroyo, dengan otaknya yang tajam, suka menganalisis segala hal. Suatu hari, mereka menemukan tablet ajaib berisi catatan misterius bernama reading_data.csv. Dengan bantuan keajaiban awk, mereka memutuskan untuk menjelajahi rahasia di balik data itu, siap menghadapi tantangan demi tantangan dalam petualangan baru mereka. 

A. Poppo baru saja mulai melihat tablet ajaib dan terpukau dengan kekerenan orang bernama “Chris Hemsworth”. Poppo jadi sangat ingin tahu berapa banyak buku yang dibaca oleh “Chris Hemsworth”. Bantu Poppo menghitung jumlah baris di tablet ajaib yang menunjukkan buku-buku yang dibaca oleh Chris Hemsworth.

Contoh Output:
Chris Hemsworth membaca 2 buku.

B. Setelah menemukan tablet ajaib, Siroyo mulai penasaran dengan kebiasaan membaca yang tersimpan di dalamnya. Ia mulai menggunakan tablet ajaib dan bergumam sambil meneliti, “Aku ingin tahu berapa lama rata-rata mereka membaca dengan benda ini”. Bantu Siroyo untuk menghitung rata-rata durasi membaca (Reading_Duration_Minutes) untuk buku-buku yang dibaca menggunakan “Tablet” 

Contoh Output:
Rata-rata durasi membaca dengan Tablet adalah 60.5 menit.

C. Sementara Siroyo sibuk menganalisis tablet ajaib, Poppo duduk disampingnya dengan ide cemerlang. “Kalau kita sudah tahu cara mereka membaca, aku ingin memberi hadiah ke temen yang paling suka sama bukunya!”. Ia pun mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca (Rating) beserta nama (Name) dan judul bukunya (Book_Title).

Contoh Output:
Pembaca dengan rating tertinggi: Brie Larson - Business Strategies - 4.7

D. Siroyo mengusap keningnya dan berkata, "Petualangan kita belum selesai! Aku harus bikin laporan untuk klub buku besok." Ia ingin membuat laporan yang istimewa dengan tablet ajaib itu, fokus pada teman-teman di Asia. "Aku penasaran genre apa yang paling populer di sana setelah tahun 2023," katanya, membuka reading_data.csv sekali lagi. Bantu Siroyo menganalisis data untuk menemukan genre yang paling sering dibaca di Asia setelah 31 Desember 2023, beserta jumlahnya, agar laporannya jadi yang terbaik di klub.

Contoh Output:
Genre paling populer di Asia setelah 2023 adalah Science dengan 1 buku.

Note:
Seluruh command dimasukkan kedalam 1 file dan gunakan kondisi if else untuk setiap soalnya.

```

#!/bin/bash

wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv

```
Command ini digunakan untuk mendownload data.csv menggunakan link drive user content dan diberi nama reading_data.csv

### A
Poppo Diminta untuk menghitung jumlah baris di tablet ajaib yang menunjukkan buku-buku yang dibaca oleh Chris Hemsworth.

```
awk -F, '
$2 == "Chris Hemsworth" {count++} 
END {
    if (count > 0) {
        print "Chris Hemsworth membaca", count, "buku."
    } else {
        print "Chris Hemsworth tidak ditemukan."
    }
}' reading_data.csv
```
Command ini akan mencari "Chris Hemsworth" pada kolom kedua di reading_data.csv. Jika hasil count > 0, makan akan mengeluarkakn output "Chris Hemsworth membaca ... buku"



### B
Siroyo diminta untuk menghitung rata-rata durasi membaca untuk buku-buku yang dibaca menggunakan “Tablet”
```
awk -F, '
{
    if ($8 == "Tablet") {
        # buat nambahin durasi membaca ke dalam sum
        sum = sum + $6
        # buat ningkatin penghitung jumlah data
        count = count + 1
    }
} 
END {
    if (count > 0) {
        print "Rata-rata durasi membaca dengan Tablet adalah", sum / count, "menit."
    } else {
        print "Tidak ada data untuk Tablet."
    }
}' reading_data.csv
```

### C
Siroyo mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca beserta nama dan judul bukunya.
```
awk -F, '
{
    if (NR > 1) {
        if ($7 > rating_max) {
           rating_max = $7
            readers_name = $2
            book_name = $3
        }
    }
}
END {
    if (rating_max > 0) {
        print "Pembaca dengan rating tertinggi:", readers_name, "-", book_name, "-", rating_max
    } else {
        print "Data rating tertinggi tidak ditemukan."
    }
}' reading_data.csv
```

### D
Siroyo menganalisis data untuk menemukan genre yang paling sering dibaca (terpopuler) di Asia setelah 31 Desember 2023, beserta jumlahnya, agar laporannya jadi yang terbaik di klub.
```
awk -F, '
{
    if ($9 == "Asia") {
        if ($5 > "2023-12-31") {
            genre_count[$4]++
        }
    }
}
END {
    most_popular_genre = ""
    highest_count = 0

    for (current_genre in genre_count) {
        if (genre_count[current_genre] > highest_count) {
            most_popular_genre = current_genre
            highest_count = genre_count[current_genre]
        }
    }

    if (most_popular_genre != "") {
        print "Genre paling populer di Asia setelah 2023 adalah", most_popular_genre, "dengan", highest_count, "buku."
    } else {
        print "Tidak ada data untuk Asia setelah 2023."
    }
}' reading_data.csv


```

### > Dokumentasi Output
![image](https://github.com/user-attachments/assets/9759b45c-d9d9-48da-9897-ac20ac7519bd)

Output langsung menampilkan seisi file karena ketentuan dari soal bahwa command harus dimasukan ke dalam file bernama popposiroyo.sh




## Soal 2

a. Tugas ini membuat dua file yaitu login.sh untuk login arcaea 
dan register.sh untuk mendaftarkan akun ke player.csv  
```touch login.sh ; touch register.sh; mkdir data && cd data; touch player.csv ```

b. Dalam register.sh password dan email harus memiliki constraint agar dapat menerima password yang sesuai dengan ketentuan. Di bawah ini merupakan perkondisian yang mencocokkan apakah email mengandung format email@domain.com | ac.id 
``` 
 if ! [[ $email =~ ^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.(com|ac.id)$ ]]

```

c. User tidak dapat register dengan menggunakan email yang sama. Hal ini dapat dilakukan dengan menggunakan command di bawah ini yang mencari email dalam player.csv, apabila ditemukan maka akan mengembalikan nilai 1 pada e_status 
``` 
 awk -F, -v ei="$email" '$1==ei {exit 1}' "$data_path";e_status=$? 
```

d. Password yang diinput harus disimpan dalam bentuk hash SHA256. (Revisi: Static Salt)
```
hash_pass=$(echo -n "$password+static_salt" | openssl dgst -sha256 | awk '{print $2}')
```

e. Core di sini adalah cpu usage dalam bentuk persen.  
```
cpu_usage=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' \<(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat)) 
``` 

f. Fragments di sini adalah ram usage dalam bentuk persen, dapat menggunakan free untuk mengetahuinya.  
```
memory_usage=$(free | grep Mem | awk '{printf("%.2f%", $3/$2 * 100)}')
```

g. Manager digunakan untuk menambah cron jobs untuk monitoring CPU dan RAM.
```
add_core(){
        (crontab -l; echo "* * * * * $core >> $corelog_dir 2>&1") | crontab -
        sudo service cron restart
        echo "Core monitoring scheduled every one minute"
}

add_frag(){
        (crontab -l; echo "* * * * * $frag >> $fraglog_dir 2>&1") | crontab -
        sudo service cron restart
        echo "Fragment monitoring scheduled every one min"
}

rm_core(){
        echo "Removing core monitor.."
        (crontab -l | grep -v "core_monitor.sh") | crontab -
}

rm_frag(){
        echo "Removing fragment monitor.."
        (crontab -l | grep -v "frag_monitor.sh") | crontab -
}
```
![WhatsApp Image 2025-03-20 at 23 13 14_d13314ba](https://github.com/user-attachments/assets/4ca6f88e-14f8-484b-b820-85ed81ad09c3)


h. Folder logs dibuat untuk menampilkan output dari cron jobs yang telah ditambahkan, berisi file core.log dan fragment.log 
Contoh Output:
```
[2025-03-14 16:13:02] - Core Usage [0.416667%] - Terminal Model [12th Gen Intel(R) Core(TM) i5-12450H]
[2025-03-18 19:10:02] - Core Usage [1.40264%] - Terminal Model [12th Gen Intel(R) Core(TM) i5-12450H]
[2025-03-18 21:27:02] - Core Usage [0.57947%] - Terminal Model [12th Gen Intel(R) Core(TM) i5-12450H]
[2025-03-18 21:28:02] - Core Usage [0.742574%] - Terminal Model [12th Gen Intel(R) Core(TM) i5-12450H]
```

i. Terminal digunakan sebagai menu utama untuk melakukan register, login, dan exit. Apabila user memilih login maka akan di-direct ke Manager.
User dapat login dengan input email, username, lalu password. (Revisi: user login dengan input email.)
```

echo " ------------------------------"
echo "|    ARCAEA TERMINAL           |"
echo "|------------------------------|"
echo "|ID| OPTION                    |"
echo "| 1| Register New Account      |"
echo "| 2| Login to Existing Account |"
echo "| 3| Exit Arcaea Terminal      |"
echo " ______________________________"
echo " "
echo " Enter Option [1-3]: "
read option

case "$option" in
        "1")
                source $register_path
                ;;
        "2")
                source $login_path
                ;;
        "3")
                exit
esac
```
![WhatsApp Image 2025-03-20 at 23 15 13_abdde0c0](https://github.com/user-attachments/assets/32dfabe9-761f-4483-b23e-ce323c400ff8)



## Soal 3

a. Membuat tampilan words of affirmations setiap detik dengan memanggil API. Tampilan setiap detik menggunakan while loop dengan sleep 1  agar ada jeda tiap detik.
(Revisi: update UI dan pemberian warna pada text affirmations.)
```  
aspiktome(){
        echo -e "\e[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
        echo -e "\e[1;36m   🎵 Now Playing: Speak to Me 🎵   \e[0m"
        echo -e "\e[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
while true
do
        affirmation=$(curl -s -H "Accept: application/json" "https://www.affirmations.dev" | jq -r '.affirmation')
        echo -e "\e[36m$affirmation\e[0m"
        sleep 1
done
}  
```

b. Membuat progress bar yang pertambahannya dalam interval 0.1s sampai 1s secara acak. (Revisi: Update UI dan Warna Loading.)  
```
bontherun(){
        echo -e "\e[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
        echo -e "\e[1;36m🎵 Now Playing: On the Run  🎵\e[0m"
        echo -e "\e[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"

for i in {1..100}; do
    sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
    printf "\r\e[1;36m[%-100s]\e[0m %d%%" $(printf "=%.0s" $(seq 1 $i)) $i
done
}
```

c. membuat live clock yang menunjukkan tanggal, jam, menit dan detik.

• Buat function dengan loop yang otomatis langsung membersihkan layar terminal. Lalu set variabel jam berdasarkan jam saat ini.
```
ctime() {
while true; do
clear
jam=$(date +"%H")
```

• Buat keterangan dalam jangka waktu jam tertentu.
```
if [ $jam -ge  3 ] && [ $jam -lt 4 ]; then pesan="SAHUR WOI!"
elif [ $jam -ge 4 ] && [ $jam -lt 10 ]; then pesan="Selamat pagi, semangat beraktivitas!"
elif [ $jam -ge 10 ] && [ $jam -lt 15 ]; then pesan="Selamat siang, lemes gak nih? Wkwk."
elif [ $jam -ge 15 ] && [ $jam -lt 18 ]; then pesan="Selamat sore, ngabuburit ngapain? Jangan lupa nyari takjil!"
elif [ $jam -ge 18 ] && [ $jam -lt 20 ]; then pesan="Selamat berbuka puasa, sob. Sholat teraweh jangan lupa, ya!"
else pesan="Selamat malam, tidur sana."
fi
```

• Buat program yang akan menampilkan Hari, Bulan (nama bulan), Tanggal, dan Tahun. Ditambah Jam, Menit, dan Detik. Lalu diberi sedikit pembatas sebagai hiasan dan memamnggil variabel pesan untuk di print. Menyetel waktu refresh tiap 1 detik.
```
date +"%A, %B %d %Y - %H:%M:%S"
echo "︶︶︶︶︶︶︶︶୨♡୧︶︶︶︶︶︶︶︶"
echo "୨♡୧ ... $pesan"
sleep 1
done
}
```

Final Script Code:
```
ctime() {
while true; do
clear
jam=$(date +"%H")

if [ $jam -ge  3 ] && [ $jam -lt 4 ]; then pesan="SAHUR WOI!"
elif [ $jam -ge 4 ] && [ $jam -lt 10 ]; then pesan="Selamat pagi, semangat beraktivitas!"
elif [ $jam -ge 10 ] && [ $jam -lt 15 ]; then pesan="Selamat siang, lemes gak nih? Wkwk."
elif [ $jam -ge 15 ] && [ $jam -lt 18 ]; then pesan="Selamat sore, ngabuburit ngapain? Jangan lupa nyari takjil!"
elif [ $jam -ge 18 ] && [ $jam -lt 20 ]; then pesan="Selamat berbuka puasa, sob. Sholat teraweh jangan lupa, ya!"
else pesan="Selamat malam, tidur sana."
fi

date +"%A, %B %d %Y - %H:%M:%S"
echo "︶︶︶︶︶︶︶︶୨♡୧︶︶︶︶︶︶︶︶"
echo "୨♡୧ ... $pesan"
sleep 1
done
}
```

d. program yang sangat disukai oleh teman yang bernama cmatrix, membuat program yang mirip, tetapi mengganti isinya dengan simbol mata uang seperti $ € £ ¥ ¢ ₹ ₩ ₿ ₣ dan lain lainnya.

• Buat function yang akan membersihkan terminal dan menyembunyikan cursor. Cursor akan otomatis kembali di posisi normal saat kita menghentikan perintah (ctrl + c).
```
dmoney() {
clear
tput civis
trap "tput cnorm; exit" SIGINT
```
• Menyatakan simbol-simbol yang akan digunakan dan juga mendata seluruh lines dan cols pada terminal.
```
simbol=("$" "€" "£" "¥" "¢" "₹" "₩" "₿" "₣")
rows=$(tput lines)
cols=$(tput cols)
```
• Membuat looping yang secara otomatis memilih kolom secara random diantara semua kolom dalam terminal, lalu membuat iterasi yang secara otomatis memindahkan cursor ke ujung terminal dan print karakter dari simbol tadi secara acak. Simbol yang muncul disetting menjadi warna pink magenta dalam jangka waktu 0,001 detik.
```
while true; do
col=$((RANDOM % cols))
for ((i=0; i<rows; i++)); do
tput cup $i $col
char=${simbol[$((RANDOM % ${#simbol[@]}))]}
echo -ne "$color$char\033[95m"
sleep 0.001
done
done
}
```

Final Script Code:
```
dmoney() {
clear
tput civis
trap "tput cnorm; exit" SIGINT

simbol=("$" "€" "£" "¥" "¢" "₹" "₩" "₿" "₣")
rows=$(tput lines)
cols=$(tput cols)

while true; do
col=$((RANDOM % cols))
for ((i=0; i<rows; i++)); do
tput cup $i $col
char=${simbol[$((RANDOM % ${#simbol[@]}))]}
echo -ne "$color$char\033[95m"
sleep 0.001
done
done
}
```

e. menampilkan proses yang sedang berjalan, seperti task manager tetapi menampilkannya di dalam terminal dan membuat agar task manager tersebut menampilkan data baru setiap detiknya.
```
ebraindamage() {
    clear
    echo -e "\033[1;35m"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "        🧠✨ Welcome to Brain Damage! ✨🧠        "
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e "\033[0m"
    
    echo -e "\033[1;33mPreparing your system for total chaos...\033[0m"
    for i in {3..1}; do
        echo -e "\033[1;31m$i...\033[0m"
        sleep 1
    done

    echo -e "\033[1;32m\nUnleashing system performance magic! 💥\033[0m"
    sleep 1

    top

    echo -e "\033[1;34m\nHope your brain survived the damage! 🌀\033[0m"
    echo -e "\033[1;36mHave a nice day! 😄\033[0m"
}

```
```
if [[ "$1" == --play=* ]]
then
	track="${1#*=}"	

	if [[ "$track" == "Speak to Me" ]]
	then
		aspiktome
	elif [[ "$track" == "On the Run" ]]
	then
		bontherun
	elif [[ "$track" == "Time" ]]
 	then
  		ctime
  	elif [[ "$track" == "Money" ]]
	then
		dmoney
    	elif [[ "$track" == "Brain Damage" ]]
     	then
      		ebraindamage
 	else
		echo "sorry gaada lagu itu"
	fi
else
	echo "Usage: $0 --play=\"song name\""
	exit 1
fi
```



## Soal 4

• Download file pokemon_usage.csv di terminal
```
wget "https://drive.usercontent.google.com/u/1/uc?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download" -O pokemon_usage.csv
```

• Buat script bernama pokemon_analysis.sh di terminal
```
nano pokemon_analysis.sh
```
![image](https://github.com/user-attachments/assets/8b7ee93d-3681-42b5-96d1-ed819bf5e824)

• Buat fitur summary dengan keyword -i atau --info berisikan informasi Pokemon dengan Usage% tertinggi dan RawUsage tertinggi
```
summary() {
highest_usage=$(awk 'BEGIN {FS=","} NR>1 {if($2+0>max1) {max1=$2+0; name1=$1}} END {print name1 " dengan " max1 "%"}' "$FILE")
highest_raw=$(awk 'BEGIN {FS=","} NR>1 {if($3+0>max2) {max2=$3+0; name2=$1}} END {print name2 " dengan " max2 " kali"}' "$FILE")
cat <<EOF
 ㅤ :¨·.·¨: .˳⁺⁎˚ ꒰ఎ info ໒ ꒱ ˚⁎⁺˳ . ￨𐑘__/,￨（｀＼
 ㅤ ˋ·.ꔫ ˊ _.￨o o ￨_ ） ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
EOF
echo "/ ❦ . . ꒰Pick Rate tertinggi : $highest_usage ꒱"
echo "/ ❦ . . ꒰Total Pick Tertinggi : $highest_raw ꒱"
echo
}
```

• Buat fitur sort dengan keyword -s atau --sort dengan urutan sesuai alfabet jika menggunakan nama dan urutan sesuai angka jika menggunakan selain nama
```
sortt() {
cat <<EOF
ㅤ :¨·.·¨: .˳⁺⁎˚ ꒰ఎ sort ໒ ꒱ ˚⁎⁺˳ . ￨𐑘__/,￨（｀＼
ㅤ ˋ·.ꔫ ˊ _.￨o o ￨_ ） ） 
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
*) echo " ୨♡୧ ... Error: Gak ada opsinya, sir. Cek di -h atau --help coba."; 
echo; 
exit 1 ;; 
esac 
echo "$(head -1 "$FILE")" && tail -n +2 "$FILE" | sort -t',' -k"$col","$col"nr 
echo 
}
```

• Buat fitur untuk mencari nama tertentu dengan keyword -g atau --grep urutannya sesuai usage% tertinggi
```
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
```

• Buat fitur untuk menspesifikasi type tertentu dengan keyword - --find urutannya juga sesuai usage% tertinggi
```
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
```

• Buat error handling tambahan menyesuaikan keperluan

```
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
```
```
*) echo "  ୨♡୧ ... Error: Gak ada opsinya, sir. Cek di -h atau --help coba.";
```
```
else
echo "  ୨♡୧ ... Error: Gak ada yang namanya kaya gitu, sir." >&2
```
```
else
echo "  ୨♡୧ ... Error: Gak ada tipenya, sir." >&2
```
```
*) cat <<EOF

ㅤ :¨·.·¨:         .˳⁺⁎˚ ꒰ఎ error ໒ ꒱ ˚⁎⁺˳ .          ￨𐑘__/,￨（｀＼
ㅤ  ˋ·.ꔫ ˊ                                            _.￨o o  ￨_ ）  ）
-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆୨♡୧⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆-⋆⋆-⋆-(((-⋆-(((⋆-⋆-⋆-⋆
  ୨♡୧ ... Error: Gak ada perintah kaya gitu, sir. Cek di -h atau --help coba.
```

• Buat help screen menarik yang menyertakan format serta fitur-fitur dan penjelasannya
```
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
```

• Buat case untuk menjalankan input dari user dan sistem akan menampilkan output sesuai dari input
```
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
```

Final Script Code:
```
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
```
