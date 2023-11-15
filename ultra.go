package main

import (
	"os"
	"os/exec"
	"path/filepath"
)

func main() {
	str, _ := os.Executable()
	str = filepath.Dir(str)
	str += "\\ultra.ps1"

	c := exec.Command("powershell", "-File", str)
	c.Run()
}