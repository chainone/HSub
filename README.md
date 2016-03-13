# HSub
A Haskell-made tiny command line tool to download subtitles from shooter    
用Haskell写的用来去射手网下载字幕的命令行工具。

# How to Install
Binaries for Mac OSX & Ubuntu have been pre-built and placed under folder "bin". You can directly copy this binary to /usr/local/bin or anywhere you want    

# Usage
example: hsub ~/Movies/The.Martian.2015.1080p.WEB-DL.DD5.1.H264-RARBG/*.mkv
result:     
```Start to retrieve subtitles for media file: The.Martian.2015.1080p.WEB-DL.DD5.1.H264-RARBG.mkv
Matched 3 subtitles on server
downloading subtitle files...
Downloaded sub file: The.Martian.2015.1080p.WEB-DL.DD5.1.H264-RARBG_0.ass
Downloaded sub file: The.Martian.2015.1080p.WEB-DL.DD5.1.H264-RARBG_1.ass
Downloaded sub file: The.Martian.2015.1080p.WEB-DL.DD5.1.H264-RARBG_2.srt```


# How to Build
1. Install Haskell Stack: http://docs.haskellstack.org/en/stable/README/    
2. Clone this repo    
3. cd HSub    
4. stack setup    
5. stack build    
 
The binary is built under folder like this HSub/.stack-work/install/x86_64-osx/lts-5.2/7.10.3/bin

# Motivation
2 years ago I used C++ to write such tool (SubD: https://github.com/chainone/SubD ) for my NAS to download subtitles automatically when a movie just finishes downloading.     
Right now, as I am learning Haskell, I think that would be interesting if I wrote the same tool using Haskell and do a comparison.

# C++ version vs Haskell version    
Lines of code:     
    Haskell 193    
    C++ 477





