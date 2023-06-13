// Package utils is a package that contains utility functions for the e2e tests.
package utils

import (
	"io"
	"os"
	"testing"
)

func RemoveTerraformOverride(t *testing.T) {
	t.Helper()
	err := DeleteFile("../override.tf")
	if err != nil {
		t.Fatalf("Failed to delete override file: %s", err)
	}
}

func OverrideTerraformForTests(t *testing.T) {
	t.Helper()
	err := CopyFile("override.tf", "../override.tf")
	if err != nil {
		t.Fatalf("Error: %s", err)
	}
}

func CopyFile(source, destination string) error {
	src, err := os.Open(source)
	if err != nil {
		return err
	}
	defer src.Close()

	dest, err := os.Create(destination)
	if err != nil {
		return err
	}
	defer dest.Close()

	_, err = io.Copy(dest, src)
	if err != nil {
		return err
	}

	return nil
}

func DeleteFile(path string) error {
	err := os.Remove(path)
	if err != nil {
		return err
	}

	return nil
}
