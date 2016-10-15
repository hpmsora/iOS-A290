//
//  ViewController.swift
//  FileStorageReadWriteDemo-Fall-2016
//
//  Created by Mitja Hmeljak on 2016-10-12.
//  Copyright © 2016 A290. All rights reserved.
//

import UIKit


// basic read/write example adapted from:
//
// https://github.com/mattneub/Programming-iOS-Book-Examples/tree/master/iOS8bookExamples
//


class ViewController: UIViewController {
    

    // provide console-like text output so that we can look at results directly on device:
    @IBOutlet weak var textViewOutput: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    @IBAction func buttonGetDocumentsPath (sender:AnyObject!) {
        let docsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last
        let docs = String(docsPath)
        print(docs)
        textViewOutput.text = textViewOutput.text + "\(docs)\n" + "--------\n"
    }
    
    @IBAction func buttonGetDocumentsURL (sender:AnyObject!) {
        let fm = NSFileManager()
        var err : NSError?
        do {
            let myDocumentsDirectoryURL = try fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
            print(myDocumentsDirectoryURL)
            textViewOutput.text = textViewOutput.text + "\(myDocumentsDirectoryURL)\n" + "--------\n"
        } catch let error as NSError {
            err = error
            print(err)
            textViewOutput.text = textViewOutput.text + "\(err)\n" + "--------\n"
        }
    }
    
    @IBAction func buttonGetAndCreateApplicationSupportURL (sender:AnyObject!) {
        let fm = NSFileManager()
        var err : NSError?
        do {
            let suppurl = try fm.URLForDirectory(.ApplicationSupportDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
            print(suppurl)
            textViewOutput.text = textViewOutput.text + "\(suppurl)\n" + "--------\n"
        } catch let error as NSError {
            err = error
            print(err)
            textViewOutput.text = textViewOutput.text + "\(err)\n" + "--------\n"
        }
    }
    
    @IBAction func buttonCreateFoldersAndFiles (sender:AnyObject!) {
        let fm = NSFileManager()
        var err : NSError?
        let myDocumentsDirectoryURL = try! fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        // error-checking omitted
        let myfolder = myDocumentsDirectoryURL.URLByAppendingPathComponent("MyFolder")
        var ok: Bool
        do {
            try fm.createDirectoryAtURL(myfolder, withIntermediateDirectories: true, attributes: nil)
            ok = true
        } catch let error as NSError {
            err = error
            ok = false
        }
        if !ok {
            print(err)
            textViewOutput.text = textViewOutput.text + "\(err)\n" + "--------\n"
            return
        }
        do {
            // if we get here, myfolder exists
            // let's put a couple of files into it
            try "hello".writeToURL(myfolder.URLByAppendingPathComponent("file1.txt"), atomically: true, encoding: NSUTF8StringEncoding)
            // if we get here, myfolder exists
            // let's put a couple of files into it
            ok = true
        } catch let error as NSError {
            err = error
            ok = false
        }
        if !ok {
            print(err)
            textViewOutput.text = textViewOutput.text + "\(err)\n" + "--------\n"
            return
        }
        do {
            try "greetings".writeToURL(myfolder.URLByAppendingPathComponent("file2.txt"), atomically: true, encoding: NSUTF8StringEncoding)
            ok = true
        } catch let error as NSError {
            err = error
            ok = false
        }
        if !ok {
            print(err)
            textViewOutput.text = textViewOutput.text + "\(err)\n" + "--------\n"
            return
        }
        print("ok")
        textViewOutput.text = textViewOutput.text + "ok\n" + "--------\n"
    }
    
    @IBAction func buttonGetContentsOfDirectory (sender:AnyObject!) {
        let fm = NSFileManager()
        var err : NSError?
        let myDocumentsDirectoryURL = try! fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        let arr: [AnyObject]?
        do {
            arr = try fm.contentsOfDirectoryAtURL(myDocumentsDirectoryURL, includingPropertiesForKeys: nil, options: [])
            
            for lDir in arr! {
                print(lDir)
                textViewOutput.text = textViewOutput.text + "\(lDir)\n" + "--------\n"
                
            }
        } catch let error as NSError {
            err = error
            arr = nil
        }
        if arr == nil {
            print(err)
            textViewOutput.text = textViewOutput.text + "\(err)\n" + "--------\n"
            return
        }
    }
    
    @IBAction func buttonDeepTraversalOfDirectory (sender:AnyObject!) {
        let fm = NSFileManager()
        var err : NSError?
        let myDocumentsDirectoryURL = try! fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        let dir = fm.enumeratorAtURL(myDocumentsDirectoryURL, includingPropertiesForKeys: nil, options: [], errorHandler: nil)!
        // this is what you do when an Objective-C enumerable doesn't conform to Swift's SequenceType
        while let f = dir.nextObject() as? NSURL {
            if f.pathExtension == "txt" {
                print(f.lastPathComponent!)
                textViewOutput.text = textViewOutput.text + "\(f.lastPathComponent!)\n" + "--------\n"
            }
        }
    }
    
    // if you set the "which" constant to 1,
    //   each data entry will be saved/retrieved using NSKeyedUnarchiver
    // if you set the "which" constant to 2,
    //   each data entry will be saved/retrieved with a NSFileCoordinator
    let which = 1
    
    @IBAction func buttonSaveOnePersonData (sender:AnyObject!) {
        let fm = NSFileManager()
        var err : NSError?
        let myDocumentsDirectoryURL = try! fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        let aPerson = Person(firstName: "First", lastName: "Last")
        let aPersonArchivedData = NSKeyedArchiver.archivedDataWithRootObject(aPerson)
        let myDataFileURL = myDocumentsDirectoryURL.URLByAppendingPathComponent("archivedDataFile.binary")
        switch which {
        case 1:
            aPersonArchivedData.writeToURL(myDataFileURL, atomically: true)
        // myDataFileURL.setResourceValue(true, forKey: NSURLIsExcludedFromBackupKey, error: &err)
        case 2:
            // ==== the NSFileCoordinator way
            let fc = NSFileCoordinator()
            let intent = NSFileAccessIntent.writingIntentWithURL(myDataFileURL, options: [])
            fc.coordinateAccessWithIntents([intent], queue: NSOperationQueue.mainQueue()) {
                (err:NSError?) in
                // compiler gets confused if a one-liner returns a BOOL result
                let ok = aPersonArchivedData.writeToURL(intent.URL, atomically: true)
            }
        default:break
        }
    }
    
    @IBAction func buttonRetrieveOnePersonData (sender:AnyObject!) {
        let fm = NSFileManager()
        var err : NSError?
        let myDocumentsDirectoryURL = try! fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        let myDataFileURL = myDocumentsDirectoryURL.URLByAppendingPathComponent("archivedDataFile.binary")
        
        // warning! here do error testing to prevent
        //   the app crashing if you try reading from a file that does not exist!
        
        switch which {
        case 1:
            let persondata = NSData(contentsOfURL: myDataFileURL)!
            let person = NSKeyedUnarchiver.unarchiveObjectWithData(persondata) as! Person
            print(person)
            textViewOutput.text = textViewOutput.text + "\(person)\n" + "--------\n"
        case 2:
            // ==== the NSFileCoordinator way
            let fc = NSFileCoordinator()
            let intent = NSFileAccessIntent.readingIntentWithURL(myDataFileURL, options: [])
            fc.coordinateAccessWithIntents([intent], queue: NSOperationQueue.mainQueue()) {
                (err:NSError?) in
                let persondata = NSData(contentsOfURL: intent.URL)!
                let person = NSKeyedUnarchiver.unarchiveObjectWithData(persondata) as! Person
                print(person)
                self.textViewOutput.text = self.textViewOutput.text + "\(person)\n" + "--------\n"
            }
        default:break
        }
    }
    
    
    
}

