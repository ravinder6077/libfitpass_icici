//
//  Downloader.swift
//  libfitpass
//
//  Created by Ravinder Singh on 23/08/22.
//

import Foundation
protocol DownloaderDelagate
{
    func downloadDidFinishedWithSuccess(responseDict:[String: Any])
    func downloadDidFinishedWithFailure(error:Error)
}

public class Downloader{
    
    var staticSecretKey = "PcoqQyqOg01ct1j2TIWlsrJGCJylKSIb3zx5mbSLm07cERG2QgCD8n9dJ84u"
    var downloadDelegate: DownloaderDelagate!
    let sdkVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String


    func getResponse (apiURL: String, params:[String:Any]){
        
//        let postData = params.data(using: .utf8)

        var request = URLRequest(url: URL(string: apiURL)!,timeoutInterval: Double.infinity)
        request.addValue("web", forHTTPHeaderField: "X-DEVICE-TYPE")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
//        request.httpBody = postData
        
        do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted) // pass dictionary to data object and set it as request body
            } catch let error {
                print("error is===",error.localizedDescription)
//                completion(nil, error)
            }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//          guard let data = data else {
//            print(String(describing: error))
////            semaphore.signal()
//            return
//          }
//            print(String(data: data!, encoding: .utf8)!)
//          semaphore.signal()
            
            // ensure there is data returned from this HTTP response
            guard let content = data else {
                print("No data")
                return
            }

            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Not containing JSON")
                return
            }


//                print("gotten json response dictionary is \n \(json)")
            // update UI using the response here
            DispatchQueue.main.sync {
                self.downloadDelegate.downloadDidFinishedWithSuccess(responseDict: json)
            }

        }

        task.resume()

//        debugPrint("apiURL====", apiURL)
//        let config = URLSessionConfiguration.default
//
//        let session = URLSession(configuration: config)
//
//        let url = URL(string: apiURL)!
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
////        debugPrint("headers====", urlRequest.allHTTPHeaderFields!)
//
//
//                let d_key = randomString()
////        let d_key = staticSecretKey
//
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
//            let str = String(data: jsonData, encoding: .utf8)!
//            debugPrint("str====", str)
//
//            let encryptedPayload = getEncryptText(plainText: str, secretKey: d_key)
//            debugPrint("encryptedPayload====", encryptedPayload)
//
//            //            let staticPayload = "vXLzhMHHXbVM3qF17Iqh82nYdXmJNWS1HqPbrd8nl2C4cEIhYVMHb0UbfZDAID31IecsAkeW7zUiBwL321lbUVQ5fc3x8DMA0xjOnDK6kdo+JQduqXxDPgqAqD81LEBhAL/BzNdBowPLTmHdF1bXbg=="
//            //            let postData = Data(staticPayload.utf8)
//
////            let postData = Data(encryptedPayload.utf8)
//            let postData = jsonData
//
//            urlRequest.httpBody = postData
//            urlRequest.setValue(String(format: "%lu", postData.count), forHTTPHeaderField: "Content-Length")
//
//            urlRequest.setValue(getEncryptedHeadersForRequestWithDynamicKey(dynamic_key: d_key), forHTTPHeaderField: "X-FITPASS-PAYLOAD")
////            urlRequest.setValue("1.0", forHTTPHeaderField: "X-SDK-VERSION")
//            urlRequest.setValue(sdkVersion, forHTTPHeaderField: "X-SDK-VERSION")
//
//            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
//
//
//            //            urlRequest.setValue("fR+CgnQFwPNqsYeR5e3wKVD8s46zB815DP9RFeh83ndjL0z4l08b1N4vRBaOHc6Q5IQY6I5utH+atvptdOKRrfA6/oAQMl09fTs06HAKUFhk4nVVvuvbgO8xFgcU4/3/7PrJWpRnNX+bNT/LHcO+lV9EieWB7mJJ1FpJv5yPIbVz/8yz5aFTuvwDEXZsq01P1lytWhrWHmQ8k/nhZCWpFHwGrmHiZGC4Qn4SWUiwUtaBSlxvMyIOKe5b5kKLJwfLLuTj8bOgFyu/v8vBON7Xne6Lg/NVXhhkD2HHs6v6TIu9SX02Nahr7LrjedgRPJZQ3JdZGhjU9ye5iECcb1rJW9Sy5EJ3MYP8gHdfdsRqrl5t6oVG6bQ6BK+BNmVIpw60", forHTTPHeaderField: "X-FITPASS-PAYLOAD")
//            //                urlRequest.setValue("web", forHTTPHeaderField: "X-DEVICE-TYPE")
//
//            debugPrint("headers====", urlRequest.allHTTPHeaderFields!)
//
//
//            let task = session.dataTask(with: urlRequest) { data, response, error in
//
//                // ensure there is no error for this HTTP response
//                guard error == nil else {
//                    print ("error: \(error!)")
//                    self.downloadDelegate.downloadDidFinishedWithFailure(error: error!)
//                    return
//                }
//
//                // ensure there is data returned from this HTTP response
//                guard let content = data else {
//                    print("No data")
//                    return
//                }
//
//                guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
//                    print("Not containing JSON")
//                    return
//                }
//
//
////                print("gotten json response dictionary is \n \(json)")
//                // update UI using the response here
//                DispatchQueue.main.sync {
//                    self.downloadDelegate.downloadDidFinishedWithSuccess(responseDict: json)
//                }
////                self.downloadDelegate.downloadDidFinishedWithSuccess(responseDict: json)
//            }
//
//            task.resume()
//        } catch {
//            print("error====22",error.localizedDescription)
//
//        }
    }
    
    func randomString() -> String {
        let length:Int = 16
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        debugPrint("returning randomString====", randomString)
        return randomString
    }
    
    func getEncryptedHeadersForRequestWithDynamicKey(dynamic_key:String) -> (String)
    {
        debugPrint("getEncryptedHeadersForRequestWithDynamicKey====")
        debugPrint("dynamic_key====", dynamic_key)
        
//        let sdkVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
        
//        var appKey = SecretKey.USER_APP_KEY_DEFAULT
//        if let apKey = ConstantSwift.UserDefault.string(forKey: SecretKey.USER_APP_KEY)
//        {
//            appKey = apKey
//        }

        let appKey = ConstantSwift.UserDefault.string(forKey: SecretKey.USER_APP_KEY) ?? SecretKey.USER_APP_KEY_DEFAULT

        let userId:String = ""
        let request = [
//            "app_key": SecretKey.USER_APP_KEY_DEFAULT,
            "app_key": appKey,
            "auth_key": SecretKey.USER_AUTH_KEY_DEFAULT,
            "device_name": "DEVICE_NAME",
            "device_os": Device.TYPE,
//            "sdk_version": "sdk_version",
            "sdk_version": sdkVersion,
                        "dynamic_secrety_key": dynamic_key,
//            "dynamic_secrety_key": "",
            "user_id": userId,
        ]
        
        
        var encryptedHeader = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: request, options: .prettyPrinted)
                let str2 = String(data: jsonData, encoding: .utf8)!
                debugPrint("str2====", str2)
                
            encryptedHeader = getEncryptText(plainText: str2, secretKey: staticSecretKey)
                debugPrint("returning encryptedHeader====", encryptedHeader)
                return encryptedHeader
                
        } catch {
            print(error.localizedDescription)
            encryptedHeader = "returnKey2"
            debugPrint("returning encryptedHeader====", encryptedHeader)
            return encryptedHeader
            
        }
        
    }
    
    func getEncryptText(plainText:String, secretKey:String) -> String
    {
        let crypLib = CryptLib()
        let cipherText = crypLib.encryptPlainTextRandomIV(withPlainText: plainText, key: secretKey)!
        return cipherText;
    }
    
    
    
}
