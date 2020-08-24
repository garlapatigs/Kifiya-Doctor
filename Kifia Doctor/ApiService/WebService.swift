//
//  WebService.swift
//  Kifia Doctor
//
//  Created by apple on 19/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class WebService: UIViewController {
    static let shared = WebService()
      func postMethod(Api: Base,parameter: [String:Any],OnCompletion : @escaping(Data) -> (Void)){
        let accessToken = Defaults.getAccessToken()
          let headerVal : HTTPHeaders  = [
                  "Content-Type":"application/json",
                  "accept":"application/json",
                  "X-Requested-With":"XMLHttpRequest",
                  "Authorization": "Bearer \(accessToken)"
              ]
          
          guard let url = URL(string: "\(baseUrl + Api.rawValue)") else{return}
          Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headerVal).responseJSON { (data) in
              switch data.result{
              case .success(_):
                  guard let response = data.data else{return}
                  guard let json = try? JSON(data: response) else{return}
//                  if Api == .login{
//                  guard let jsonData = try? JSONDecoder().decode(loginApi.self, from: response)  else{return}
//                  self.login = jsonData
//                  }
                  print("\(url)",json)
                  OnCompletion(response)
                  break
              case .failure(let error):
                  print(error.localizedDescription)
              }
          }
    }
}
