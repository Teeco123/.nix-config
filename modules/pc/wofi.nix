{ pkgs, ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
      width = 720;
      height = "20%";
      prompt = "search";
      allow_images = false;
      close_on_focus = true;
      insensitive = true;
      no_actions = true;
    };
    style = ''
                        * {
                            font-family: "JetBrainsMono Nerd Font", "NotoSansMono Nerd Font", "Font Awesome 6 Brands", "JetBrains Mono", "Fira Code", "Inconsolata", "Noto Sans", monospace;
                            color: rgba(0,158,255,1);
                        }
                          
                        #window {
                            margin: auto;
                            padding: 10px;
                            border-radius: 20px;
                            border: 2px solid rgba(66,184,253,1);
                            background: rgba(245,195,205,0.8);
                        }

                        #input {
                            padding: 10px;
                            margin-bottom: 10px;
                            border-radius: 15px;
                        }

                        #input:focus {
                        		box-shadow: none;
                        }

                        #outer-box {
                            padding: 20px;
                        }

                        #img {
                            margin-right: 6px;
                        }

                        #entry {
                            padding: 10px;
                            border-radius: 15px;
                        }

                        #entry:selected {
                            background-color: rgba(166,227,248,0.85);
      											outline: none;
                        }

                        #text {
                            margin: 2px;
                        }
    '';
  };
}
