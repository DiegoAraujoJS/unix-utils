package main

import (
	"flag"
	"math/rand"
	"os"
	"os/exec"
	"sync"

	"github.com/h2non/filetype"
)

func GetPictures(path string, pictures []string) []string {
    // Get all files in the directory
    files, err := os.ReadDir(path)
    if err != nil {
        panic(err)
    }
    result := make([]string, 0)
    for _, file := range files {
        // If the file is a directory, get all pictures in it
        if file.IsDir() {
            result = append(result, GetPictures(path + "/" + file.Name(), pictures)...)
        } else {
            f, _ := os.ReadFile(path + "/" + file.Name())
            if filetype.IsImage(f) {
                result = append(result, path + "/" + file.Name())
            }
        }
    }
    return result
}

func main() {
    random := flag.Bool("random", false, "Get a random wallpaper")
    no_change := flag.Bool("no-change", false, "Don't change the wallpaper")
    flag.Parse()
    home := os.Getenv("HOME")
    wg := sync.WaitGroup{}
    pictures := GetPictures(home + "/Pictures/wallpapers", make([]string, 0))
    current_wallpaper, _ := os.ReadFile(home + "/.current_wallpaper")
    current_wallpaper_index := -1
    new_wallpaper_index := 0

    // Find the index of the current wallpaper in the list of wallpapers
    for i, wallpaper := range pictures {
        if wallpaper == string(current_wallpaper) {
            current_wallpaper_index = i
        }
    }

    // Read if the "--random" flag was passed in.
    // If it was, get a random wallpaper from the list of wallpapers.
    // If it wasn't, get the next wallpaper in the list.
    if *random && !*no_change {
        choose_new_index:
        new_wallpaper_index = rand.Intn(len(pictures))
        // If the new wallpaper is the same as the current wallpaper, try again.
        if new_wallpaper_index == current_wallpaper_index && len(pictures) > 1 {
            goto choose_new_index
        }
    } else if !*no_change {
        if current_wallpaper_index == len(pictures) - 1 {
            new_wallpaper_index = 0
        } else {
            new_wallpaper_index = current_wallpaper_index + 1
        }
    }

    wg.Add(2)
    go func (full_path string) {
        exec.Command("feh", "--bg-scale", full_path).Run()
        wg.Done()
    } (pictures[new_wallpaper_index])

    go func (full_path string) {
        os.WriteFile(home + "/.current_wallpaper", []byte(pictures[new_wallpaper_index]), 0644)
        wg.Done()
    }(pictures[new_wallpaper_index])

    wg.Wait()
}
