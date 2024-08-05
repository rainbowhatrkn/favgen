# 🎨 Favgen by TRHACKNON 🎨

Welcome to **Favgen by TRHACKNON** – a fun and dynamic favicon generator script that helps you create favicons, Apple Touch icons, HTML tags, and manifest files easily!

![Banner](https://via.placeholder.com/800x200.png?text=Favgen+by+TRHACKNON)

## Features
- Generate Favicons of various sizes
- Create Apple Touch Icons
- Generate HTML tags
- Create a `manifest.json` file
- Package everything into a ZIP file for easy download

## Requirements
- **ImageMagick**: Ensure you have ImageMagick installed to use this script.

## Usage
### Running the Script
```bash
./favgen.sh
```
Follow the on-screen prompts to provide the source image and application name, and choose the desired options.

<details>
  <summary><strong>Options</strong></summary>

  - **Generate Favicons**: Generates favicons of various sizes.
  - **Generate Apple Touch Icons**: Generates Apple Touch icons for different devices.
  - **Generate Both**: Generates both favicons and Apple Touch icons.
  - **Create a ZIP of All Generated Files**: Packages all generated files into a single ZIP file.
  - **Exit**: Exit the script.

</details>

<details>
  <summary><strong>Creating HTML Tags</strong></summary>

  After generating icons, the script can create HTML tags to include in your web pages:
  ```html
  <link rel="icon" type="image/png" sizes="16x16" href="your-image-16x16.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="your-image-32x32.png" />
  <link rel="icon" type="image/png" sizes="64x64" href="your-image-64x64.png" />
  <link rel="icon" type="image/png" sizes="96x96" href="your-image-96x96.png" />
  <link rel="icon" type="image/png" sizes="128x128" href="your-image-128x128.png" />
  <link rel="icon" type="image/png" sizes="256x256" href="your-image-256x256.png" />
  <link rel="apple-touch-icon" sizes="152x152" href="your-image-apple-touch-icon-152x152.png" />
  <link rel="apple-touch-icon" sizes="167x167" href="your-image-apple-touch-icon-167x167.png" />
  <link rel="apple-touch-icon" sizes="180x180" href="your-image-apple-touch-icon-180x180.png" />
  ```

</details>

<details>
  <summary><strong>Creating manifest.json</strong></summary>

  The script can generate a `manifest.json` file for your web app:
  ```json
  {
    "name": "YourAppName",
    "short_name": "YourAppName",
    "start_url": "/",
    "display": "standalone",
    "background_color": "#ffffff",
    "theme_color": "#000000",
    "icons": [
      {
        "src": "your-image-72x72.png",
        "sizes": "72x72",
        "type": "image/png"
      },
      {
        "src": "your-image-96x96.png",
        "sizes": "96x96",
        "type": "image/png"
      },
      {
        "src": "your-image-128x128.png",
        "sizes": "128x128",
        "type": "image/png"
      },
      {
        "src": "your-image-144x144.png",
        "sizes": "144x144",
        "type": "image/png"
      },
      {
        "src": "your-image-152x152.png",
        "sizes": "152x152",
        "type": "image/png"
      },
      {
        "src": "your-image-192x192.png",
        "sizes": "192x192",
        "type": "image/png"
      },
      {
        "src": "your-image-384x384.png",
        "sizes": "384x384",
        "type": "image/png"
      },
      {
        "src": "your-image-512x512.png",
        "sizes": "512x512",
        "type": "image/png"
      }
    ]
  }
  ```

</details>

## Fun Features

- **🎨 Fun Banners and Colors**: Enjoy colorful banners and interactive prompts to make the process enjoyable!
- **🐄 Cow Sayings**: Delightful cow saying welcome messages!
- **🗂️ All-in-One ZIP**: Package everything into a convenient ZIP file.

![Cow Say](https://via.placeholder.com/400x200.png?text=Welcome+to+the+Favicon+Generator)

## Installation
### ImageMagick
Make sure you have ImageMagick installed:
```bash
sudo apt-get install imagemagick
```

### Script
Clone this repository and navigate to the directory:
```bash
git clone https://github.com/tucommenceapousser/favgen.git
cd favgen
chmod +x main.sh
```

## Contributing
Feel free to fork this repository, make improvements, and create pull requests. Your contributions are welcome!

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Credits
- Developed by TRHACKNON
- Inspired by the need for simple and fun favicon generation

Enjoy creating your favicons with **Favgen by TRHACKNON**! 🎉

---

![Footer Image](https://via.placeholder.com/800x100.png?text=Happy+Coding!)
