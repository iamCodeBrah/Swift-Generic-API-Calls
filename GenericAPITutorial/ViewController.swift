//
//  ViewController.swift
//  GenericAPITutorial
//
//  Created by YouTube on 2023-04-25.
//

import UIKit

class ViewController: UIViewController {
    
    let service = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        
//        self.singleRequest()
//        self.arrayRequest()
        self.postRequest()
    }
    
    private func singleRequest() {
        let request = Endpoint.fetchOnePost(postId: 5).request!
        
        service.makeRequest(with: request, respModel: Post.self) { post, error in
            if let error = error { print("DEBUG PRINT:", error); return }
            
            print("DEBUG PRINT:", post)
        }
    }
    
    private func arrayRequest() {
        let request = Endpoint.fetchPosts().request!
        
        service.makeRequest(with: request, respModel: [Post].self) { posts, error in
            if let error = error { print("DEBUG PRINT:", error); return }
            
            posts?.forEach({
                print($0.title)
            })
        }
    }
    
    private func postRequest() {
        let post = Post(userId: 5, id: 12, title: "My Post", body: "This is my post!!! Its from CodeBrah")
        let request = Endpoint.sendPost(post: post).request!
        
        service.makeRequest(with: request, respModel: Post.self) { postedPost, error in
            if let error = error { print("DEBUG PRINT:", error); return }
            
            print("DEBUG PRINT:", postedPost)
        }
    }
    
}

