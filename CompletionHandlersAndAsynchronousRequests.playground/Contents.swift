//: Playground - noun: a place where people can play

import UIKit

// First, define a URL to retrieve a JSON file from
let address : String = "http://www.learnswiftonline.com/Samples/subway.json"

// Try to make a URL request object
if let url = NSURL(string: address) {
    
    // We have an valid URL to work with
    print(url)
    
    // Now we need to create an NSURLSession object to send the request to the server
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: config)
    
} else {
    
    // The NSURL object could not be created
    print("Error: Cannot create the NSURL object.")
    
}
