# DataPersistence
DataPersistence is a drop in class that allows easy persistance of data using NSKeyedArchiver/NSKeyedUnarchiver.

## Requirements
DataPersistence requires Swift 2 and Xcode 7.1 to run.

## Adding DataPersistence To Your Project
### CocoaPods
[CocoaPods](http://cocoapods.org/) is the recommended way to add DataPersistence to your project.

1. Add a pod entry for DataPersistence to your Podfile `pod 'DataPersistence', '~> 0.1.0'`.
2. Install the pod(s) by running `pod install`.
3. ...
4. Profit

### Source Files
Add the files located in the `DataPersistence` directory to your project.

## Usage
DataPersistence has two class methods one to save data to disk and one to load data from disk.

To save data to disk call:

```
DataPersistence.saveData(data: AnyObject, directory: NSSearchPathDirectory, filename: String)
```

To load data from disk call:

```
DataPersistence.loadData(directory: NSSearchPathDirectory, filename: String)
```

## Changelog
The changelog can be viewed [here](https://github.com/tomdiggle/datapersistence/blob/master/Changelog.markdown).

## License
DataPersistence is distributed under the [MIT License](https://github.com/tomdiggle/datapersistence/blob/master/LICENSE).