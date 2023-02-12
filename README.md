
CheapCell makes you force on view component without consider cell.

## Contents

- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)


## Requirements

- iOS 13.0+
- Xcode 11.0+
- Swift 5.0+


## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 11+ is required to build SnapKit using Swift Package Manager.

To integrate SnapKit into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/HParis/CheapCell", .upToNextMajor(from: "0.0.1"))
]
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate CheapCell into your project manually.

---

## Usage

### Quick Start

```swift
import CheapCell

class AView: UIView, CheapCell {

}

class BView: UIView, CheapCell {

}

class UICollectioViewExample { 

    // Register cheap cell 
    collectionView.registerCheapCell(AView.self)
    collectionView.registerCheapCell(BView.self)

    // Reuse cheep cell
    let cell = collectionView.dequeueReusableCheapCell(for: indexPath) as CollectionCell<AView>
    let cell = collectionView.dequeueReusableCheapCell(for: indexPath) as CollectionCell<BView>
    
}

class UITableViewExample {
    // Register cheap cell 
    tableView.registerCheapCell(AView.self)
        tableView.registerCheapCell(BView.self)

    // Reuse cheep cell
    let cell = tableView.dequeueReusableCheapCell(for: indexPath) as CollectionCell<AView>
    let cell = tableView.dequeueReusableCheapCell(for: indexPath) as CollectionCell<BView>
}

```


## License

CheapCell is released under the MIT license. See LICENSE for details.
