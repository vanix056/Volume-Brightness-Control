# Volume & Brightness Control via Hand Gestures

## Overview

This project enables touchless control of system volume and screen brightness using real-time hand gesture recognition. It leverages a standard webcam to track both hands simultaneously — the right hand adjusts system volume while the left hand controls screen brightness. The distance between the thumb tip and index finger tip is mapped to a 0–100% control range, providing an intuitive pinch-based interface. The implementation supports both **macOS** and **Windows** environments.

## Key Features

- **Dual-hand gesture control** — left hand for brightness, right hand for volume, processed simultaneously in real time
- **Pinch-distance mapping** — Euclidean distance between thumb (landmark 4) and index finger (landmark 8) is interpolated to a 0–100 control range
- **Real-time hand landmark detection** — powered by MediaPipe Hands with configurable detection and tracking confidence thresholds
- **Cross-platform support** — macOS via `osascript` / `brightness` CLI and AppleScript; Windows via `pycaw` and `screen-brightness-control`
- **Live visual feedback** — landmarks, hand connections, and finger-tip markers rendered on the webcam feed

## Tech Stack

| Category | Technology |
|---|---|
| Language | Python 3.11 |
| Computer Vision | OpenCV (`cv2`) |
| Hand Tracking | MediaPipe |
| Volume Control (Windows) | pycaw, comtypes |
| Volume Control (macOS) | osascript (AppleScript) |
| Brightness Control (Windows) | screen-brightness-control (`sbc`) |
| Brightness Control (macOS) | `brightness` CLI, AppKit (`NSScreen`) |
| Scripting | AppleScript (`.scpt`) |
| Notebook Environment | Jupyter Notebook |

## Installation

### Prerequisites

- Python 3.11
- A working webcam
- **macOS**: Install the [`brightness`](https://github.com/nriley/brightness) CLI tool (`brew install brightness`)
- **Windows**: Run on a native Windows environment (pycaw requires the Windows Core Audio API)

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/MAbdullahWaqar/Volume-Brightness-Control.git
cd Volume-Brightness-Control

# 2. Create and activate a virtual environment (recommended)
python -m venv venv
source venv/bin/activate        # macOS/Linux
venv\Scripts\activate           # Windows

# 3. Install dependencies
pip install opencv-python mediapipe numpy screen-brightness-control

# Windows only
pip install pycaw comtypes

# macOS only (AppKit is bundled with macOS Python)
# Ensure the 'brightness' CLI is installed:
brew install brightness
```

## Usage

Open and run the Jupyter Notebook:

```bash
jupyter notebook "V&B.ipynb"
```

Execute the appropriate cell for your platform:

- **macOS cell** — uses `AppKit`, `osascript`, and the `brightness` CLI
- **Windows cell** — uses `pycaw` and `screen_brightness_control`

Once running, a webcam window titled **"Mouse"** will open:

| Hand | Gesture | Action |
|---|---|---|
| Left | Pinch (thumb ↔ index) | Adjust screen brightness (0–100%) |
| Right | Pinch (thumb ↔ index) | Adjust system volume (0–100%) |

- **Spread fingers wide** → maximum brightness / volume
- **Bring fingers close together** → minimum brightness / volume
- Press **`q`** to quit

## Project Structure

```
Volume-Brightness-Control/
├── V&B.ipynb               # Main notebook — hand tracking & gesture control logic
├── set_brightness.scpt     # AppleScript helper for macOS display brightness
└── README.md
```

## Configuration

The following parameters can be tuned directly in the notebook source:

| Parameter | Default | Description |
|---|---|---|
| `min_detection_confidence` | `0.75` | Minimum confidence for initial hand detection |
| `min_tracking_confidence` | `0.75` | Minimum confidence to continue tracking a detected hand |
| `max_num_hands` | `2` | Maximum number of hands tracked simultaneously |
| Frame width / height | `640 × 480` | Webcam capture resolution |
| Distance range | `[50, 220]` px | Pixel distance range mapped to 0–100% control |

## Contributing

1. Fork the repository and create a feature branch (`git checkout -b feature/your-feature`)
2. Make your changes with clear, focused commits
3. Ensure the notebook runs end-to-end without errors on your target platform
4. Open a pull request with a concise description of the change and its motivation

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Author

**Muhammad Abdullah Waqar**
- GitHub: [@MAbdullahWaqar](https://github.com/MAbdullahWaqar)
