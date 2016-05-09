//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

// Define a completion handler
// The completion handler is what gets called when this **asynchronous** network request is completed.
// This is where we'd process the JSON retrieved
let myCompletionHandler : (NSData?, NSURLResponse?, NSError?) -> Void = {
    
    (data, response, error) in
    
    // This is the code run when the network request completes
    // When the request completes:
    // 
    // data - contains the data from the request
    // response - contains the HTTP response code(s)
    // error - contains any error messages, if applicable
    
    print("")
    print("====== data from the request follows ======")
    print(data)
    print("")
    print("====== response codes from the request follows ======")
    print(response)
    print("")
    print("====== errors from the request follows ======")
    print(error)


}

// Now, define a URL to retrieve a JSON file from
let address : String = "http://www.learnswiftonline.com/Samples/subway.json"

// Try to make a URL request object
if let url = NSURL(string: address) {
    
    // We have an valid URL to work with
    print(url)
    
    // Now we create a URL request object
    let urlRequest = NSURLRequest(URL: url)
    
    // Now we need to create an NSURLSession object to send the request to the server
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: config)
    
    // Now we create the data task and specify the completion handler
    let task = session.dataTaskWithRequest(urlRequest, completionHandler: myCompletionHandler)
    
    // Finally, we tell the task to start (despite the fact that the method is named "resume")
    task.resume()
    
} else {
    
    // The NSURL object could not be created
    print("Error: Cannot create the NSURL object.")
    
}

// This playground page needs to continue executing until stopped, since network reqeusts are asynchronous
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true