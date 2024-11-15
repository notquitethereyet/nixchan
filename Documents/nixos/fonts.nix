{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];
  fonts.enableDefaultPackages = false;
  fonts.fontconfig.defaultFonts.emoji = [ "Noto Color Emoji" ];
  fonts.fontconfig.defaultFonts.monospace = [ "MesloLGS NF" ];
  fonts.fontconfig.defaultFonts.sansSerif = [
    "Noto Sans"
    "Noto Sans CJK SC"
    "Noto Sans CJK TC"
    "Noto Sans CJK JP"
    "Noto Sans CJK KR"
    "Noto Sans CJK HK"
    "Noto Sans CJK VN"
    "Noto Sans CJK Sans"
    "Noto Sans CJK Serif"
  ];
  fonts.fontconfig.defaultFonts.serif = [
    "Noto Serif"
    "Noto Serif CJK SC"
    "Noto Serif CJK TC"
    "Noto Serif CJK JP"
    "Noto Serif CJK KR"
    "Noto Serif CJK HK"
    "Noto Serif CJK VN"
    "Noto Serif CJK Serif"
  ];
}