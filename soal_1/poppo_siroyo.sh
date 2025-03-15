#!/bin/bash

wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv

# INI A
awk -F, '
$2 == "Chris Hemsworth" {count++} 
END {
    if (count > 0) {
        print "Chris Hemsworth membaca", count, "buku."
    } else {
        print "Chris Hemsworth tidak ditemukan."
    }
}' reading_data.csv


# INI B
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


# INI C
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


# INI D
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
