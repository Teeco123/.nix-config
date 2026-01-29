{ lib, pkgs, ... }:
{
  globals.mapleader = " ";
  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = ":Telescope find_files<CR>";
      options = {
        desc = "Fuzzy find";
        remap = false;
      };
    }
    {
      mode = "n";
      key = "<C-s>";
      action = ":w<CR>";
      options = {
        desc = "Save file";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = ":nohlsearch<CR>";
      options = {
        desc = "Clear search results";
      };
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        desc = "Half down and center";
      };
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Half up and center";
      };
    }
    {
      mode = "n";
      key = "n";
      action = "nzz";
      options = {
        desc = "Next result and center";
      };
    }
    {
      mode = "n";
      key = "N";
      action = "Nzz";
      options = {
        desc = "Previous result and center";
      };
    }
    {
      mode = [
        "n"
        "i"
      ];
      key = "<Up>";
      action = "<Nop>";
      options = {
        desc = "Remove up arrow";
      };
    }
    {
      mode = [
        "n"
        "i"
      ];
      key = "<Down>";
      action = "<Nop>";
      options = {
        desc = "Remove down arrow";
      };
    }
    {
      mode = [
        "n"
        "i"
      ];
      key = "<Left>";
      action = "<Nop>";
      options = {
        desc = "Remove left arrow";
      };
    }
    {
      mode = [
        "n"
        "i"
      ];
      key = "<Right>";
      action = "<Nop>";
      options = {
        desc = "Remove right arrow";
      };
    }
  ];
}
