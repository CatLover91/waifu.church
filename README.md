# waifu.church
The ultimate place of worship

## What is it?
This is a placeholder website designed to give you waifus _on demand_. Mainly this is for people who enjoy that rice aesthetic of transparent png waifus on flat backgrounds, [like on catbox.moe](https://catbox.moe). Current usage for this software isn't live since it was initially something for me to learn lapis on, but rolling your own version of the software gives the two following routes:

`https://waifu.church/300/x`: gives an image with a width of 300px and the height scaled to keep the original aspect ratio (can't be croppin our waifus)

`https://waifu.church/x/300`: gives an image with a height of 300 and the width scaled instead

## Running from source
You need Nodejs, Yarn, and imagemagick installed

Once those core dependencies are installed, install dependencies:

```
yarn
```

then run the server:
```
npm run start
```

## Todo
* style errthang
* Add waifus
* Add more routes
* Optimize serving
* Optimize parsing
* Waifu Browser™
