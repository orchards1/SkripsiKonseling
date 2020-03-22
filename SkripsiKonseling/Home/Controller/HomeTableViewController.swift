//
//  HomeTableViewController.swift
//  SkripsiKonseling
//
//  Created by Michael Louis on 22/03/20.
//  Copyright © 2020 Michael Louis. All rights reserved.


import UIKit
import Firebase

class HomeTableViewController: UITableViewController {

    
    var posts: [Posts] = [Posts]()
    //assign class Posts
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.tableView.backgroundColor = #colorLiteral(red: 0.01085114758, green: 0.07561907917, blue: 0.1048899814, alpha: 1)
        print("jalan")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        
        posts = [Posts]()
        (UIApplication.shared.delegate as! AppDelegate).fireBaseRef.observe(.value, with: { snapshot in
            let dictRoot = snapshot.value as? [String : AnyObject] ?? [:]
            let dictPosts = dictRoot["Posts"] as? [String : AnyObject] ?? [:]
            for key in Array(dictPosts.keys)
            {
                self.posts.append(Posts(Dictionary: dictPosts[key] as! [String: AnyObject], key: key))
            }
            self.tableView?.reloadData()
            print(dictPosts)
            print("jalan")
        })
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        let eachPosts = posts[indexPath.row]
        cell.curhatLabel?.text = eachPosts.texts
        cell.usernameLabel?.text = eachPosts.name
        print(eachPosts.texts)
        print(eachPosts.name)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
