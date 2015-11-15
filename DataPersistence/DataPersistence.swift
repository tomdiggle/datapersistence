//
//  DataPersistence.swift
//  DataPersistence 0.1.0
//
//  Created by Tom Diggle
//  http://tomdiggle.com
//

import Foundation

/// Data persistence errors
public let DataPersistenceErrorDomain = "com.tomdiggle.datapersistence.error"

enum DataPersistenceError : ErrorType {
    case FileDirectoryNotFound
    case FilePathNotFound
}

class DataPersistence {
    
    // MARK: Saving Data
    
    /**
        Save data to disk using NSKeyedArchiver and returns a Boolean value that indicates whether the operation was successful.
        
        - Parameters:
            - data: The data that needs to be saved.
            - directory: The directory to save the data to.
            - filename: The filename of the data.
    
        - Returns: true if the operation was successful, otherwise false.
    */
    class func saveData(data: AnyObject, directory: NSSearchPathDirectory, filename: String) throws -> Bool {
        if let filepath: String = try DataPersistence.filepath(directory, filename: filename) {
            NSKeyedArchiver.archiveRootObject(data, toFile: filepath)
            
            return true;
        }
        
        return false
    }
    
    // MARK: Loading Data
    
    /**
        Decodes and returns data from a given filepath.
    
        - Parameters:
            - directory: The directory the data is located.
            - filename: The filename of the data.
    
        - Returns: The object graph previously encoded by saveData:. Returns nil if there is no file at the given path.
    */
    class func loadData(directory: NSSearchPathDirectory, filename: String) throws -> AnyObject? {
        if let filepath: String = try DataPersistence.filepath(directory, filename: filename) {
            if let data: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile(filepath) {
                return data
            }
        }
        
        return nil
    }
    
    // MARK: Helper Methods
    
    /**
        Returns a URL for the specified common directory.
    
        - Parameters:
            - directory: The search path directory. The supported values are described in NSSearchPathDirectory.
    
        - Throws: `DataPersistenceError.FileDirectoryNotFound` if the directory can not be found.
    
        - Returns: Returns a URL for the specified common directory.
    */
    private class func directoryURL(directory: NSSearchPathDirectory) throws -> NSURL {
        do {
            let fileDirectory = try NSFileManager.defaultManager().URLForDirectory(directory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: false)
            return fileDirectory
        } catch {
            throw DataPersistenceError.FileDirectoryNotFound
        }
    }
    
    /**
        Returns a string representation of the relative file path.
     
        - Parameters:
            - directory: The directory the file is stored in.
            - filename: The name of the file.
     
        - Throws: `DataPersistenceError.FilePathNotFound` if the file path can not be found.
     
        - Returns: A string representation of the relative file path.
     */
    private class func filepath(directory: NSSearchPathDirectory, filename: String) throws -> String? {
        guard !filename.isEmpty else {
            return nil
        }
        
        do {
            let directoryURL = try DataPersistence.directoryURL(directory)
            let filepath = directoryURL.relativePath! + "/" + filename
            return filepath
        } catch {
            throw DataPersistenceError.FilePathNotFound
        }
    }
    
}
