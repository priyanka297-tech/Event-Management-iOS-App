//
//  checkViewController.swift
//  Event_Management_App
//
//  Created by WCTM 08 on 21/10/24.
//


import UIKit
import FirebaseCore
import FirebaseDatabase

class checkViewController: UIViewController, UITableViewDataSource, UIWebViewDelegate , UITableViewDelegate , UITextFieldDelegate{

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var tasks: UITextField!
    @IBOutlet weak var category: UITextField!
    
        var ref: DatabaseReference!
        var databaseHandle: DatabaseHandle?
        
        var postData = [String]()
        var postKeys = [String]()
        var editingIndex: Int?

        override func viewDidLoad() {
            super.viewDidLoad()
            addView.isHidden = true
            
            ref = Database.database().reference()
            databaseHandle = ref?.child("post").observe(.childAdded, with: {(snapshot) in
                let post = snapshot.value as? String
                let key = snapshot.key
                
                if let actualpost = post {
                    self.postData.append(actualpost)
                    self.postKeys.append(key)
                    self.table.reloadData()
                }
            })
            
            table.delegate = self
            table.dataSource = self
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return postData.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = postData[indexPath.row]
        return cell
    }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Set up for editing
            editingIndex = indexPath.row
            tasks.text = postData[indexPath.row]
            category.text = "Edit Category"
            addView.isHidden = false
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let keyToDelete = postKeys[indexPath.row]
                ref?.child("post").child(keyToDelete).removeValue()
                postData.remove(at: indexPath.row)
                postKeys.remove(at: indexPath.row)
                table.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        @IBAction func editBtn(_ sender: UIButton) {
            addView.isHidden = false
            if let index = editingIndex {
                tasks.text = postData[index]
               
            } else {
                tasks.text = ""
                category.text = ""
            }
        }
        
        @IBAction func addnote(_ sender: UIButton) {
            guard let taskText = tasks.text, !taskText.isEmpty, let categoryText = category.text, !categoryText.isEmpty else {
                return
            }
            if let editingIndex = editingIndex {
                let keyToUpdate = postKeys[editingIndex]
                ref?.child("post").child(keyToUpdate).setValue(categoryText)
                postData[editingIndex] = taskText
                table.reloadRows(at: [IndexPath(row: editingIndex, section: 0)], with: .automatic)
                self.editingIndex = nil
            }
            else {
                
                let newPostRef = ref?.child("post").childByAutoId()
                newPostRef?.setValue(categoryText)
                if let newPostKey = newPostRef?.key {
                    postData.append(taskText)
                    postKeys.append(newPostKey)
                    table.reloadData()
                }
            }
            
            addView.isHidden = true
            tasks.text = ""
            category.text = ""
        }
    }
