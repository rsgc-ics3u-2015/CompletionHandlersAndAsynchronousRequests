//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

// If data is successfully retrieved from the server, we can parse it here
func parseMyJSON(theData : NSData) {
    
    // Print the provided data
    print("")
    print("====== the data provided to parseMyJSON is as follows ======")
    print(theData)

    // De-serializing JSON can throw errors, so should be inside a do-catch structure
    do {
        
        // Do the initial de-serialization
        // Source JSON is here:
        // http://www.learnswiftonline.com/Samples/subway.json
        //
        let json = try NSJSONSerialization.JSONObjectWithData(theData, options: NSJSONReadingOptions.AllowFragments) as! AnyObject
        
        // Print retrieved JSON
        print("")
        print("====== the retrieved JSON is as follows ======")
        print(json)
        
        // Now we can parse this...
        print("")
        print("Now, add your parsing code here...")

    } catch let error as NSError {
        print ("Failed to load: \(error.localizedDescription)")
    }

    
}

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
    
    // Cast the NSURLResponse object into an NSHTTPURLResponse objecct
    if let r = response as? NSHTTPURLResponse {
        
        // If the request was successful, parse the given data
        if r.statusCode == 200 {
            
            if let d = data {
                
                // Parse the retrieved data
                parseMyJSON(d)
                
            }
            
        }
        
    }


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