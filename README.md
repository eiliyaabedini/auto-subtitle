# Automatic subtitles in your videos

This repository uses `ffmpeg` and [OpenAI's Whisper](https://openai.com/blog/whisper) to automatically generate and overlay subtitles on any video.

## Installation

To get started, you'll need Python 3.7 or newer. Install the binary by running the following command:

    pip install git+https://github.com/eiliyaabedini/auto-subtitle.git

You'll also need to install [`ffmpeg`](https://ffmpeg.org/), which is available from most package managers:

```bash
# on Ubuntu or Debian
sudo apt update && sudo apt install ffmpeg

# on MacOS using Homebrew (https://brew.sh/)
brew install ffmpeg

# on Windows using Chocolatey (https://chocolatey.org/)
choco install ffmpeg
```

## Usage

The following command will generate a `subtitled/video.mp4` file contained the input video with overlayed subtitles.

    auto_subtitle /path/to/video.mp4 -o subtitled/

The default setting (which selects the `small` model) works well for transcribing English. You can optionally use a bigger model for better results (especially with other languages). The available models are `tiny`, `tiny.en`, `base`, `base.en`, `small`, `small.en`, `medium`, `medium.en`, `large`.

    auto_subtitle /path/to/video.mp4 --model medium

Adding `--task translate` will translate the subtitles into English:

    auto_subtitle /path/to/video.mp4 --task translate

Just SRT file:

    auto_subtitle /path/to/video.mp4 --srt_only true
    
Run the following to view all available options:

    auto_subtitle --help
    
## Docker
You can use docker to make subtitle
Docker image:

    eiliya/auto-subtitle

Different images for different models (Don't need to specify model name on the command anymore):

    - Tiny: eiliya/auto-subtitle:tiny
    - Small: eiliya/auto-subtitle:small   (Also as latest: eiliya/auto-subtitle)
    - Medium: eiliya/auto-subtitle:medium
    - Large: eiliya/auto-subtitle:large

Note: You need to mount your current folder (or any folder that your video exist on, to `/root` folder of container)

    docker run -v .:/media eiliya/auto-subtitle

Sample of full docker run command with additional commands:

    docker run -v .:/media eiliya/auto-subtitle --srt_only true --task translate video.mp4 
    
Or

    docker run -v /path/to:/media eiliya/auto-subtitle --srt_only true --task translate video.mp4 

Or

    docker run -v /path/to:/media eiliya/auto-subtitle video.mp4 --srt_only true --task translate 

As you can see, you still can pass `auto_subtitle` commands by docker 

## License

This script is open-source and licensed under the MIT License. For more details, check the [LICENSE](LICENSE) file.
