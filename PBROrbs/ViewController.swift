//
//  ViewController.swift
//  PBROrbs
//
//  Created by Hao Dong on 03/10/2016.
//  Copyright © 2016 MediumBlog. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var button: UIButton!
    
    let scene = SCNScene(named: "sphere.obj")!
    var sphereNode: SCNNode!
    
    let materialPrefixes : [String] = ["bamboo-wood-semigloss",
                                       "oakfloor2",
                                       "scuffed-plastic",
                                       "rustediron-streaks",
                                       "gold-scuffed",
                                       "greasy-metal-pan1",
                                       "harshbricks"];

    override func viewDidLoad() {
        super.viewDidLoad()
        // create a new scene
//        let scene = SCNScene(named: "sphere.obj")!
        
        // select the sphere node - As we know we only loaded one object
        // we select the first item on the children list
        sphereNode = scene.rootNode.childNodes[0]
        
        
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        let material = sphereNode.geometry?.firstMaterial
        print(material)
        // Declare that you intend to work in PBR shading mode
        // Note that this requires iOS 10 and up
//        material?.lightingModel = SCNMaterial.LightingModel.physicallyBased
        
        // Setup the material maps for your object
        material?.diffuse.contents = UIImage(named: "IMG_0012.JPG")
        let materialFilePrefix = materialPrefixes[4]
        material?.roughness.contents = UIImage(named: "\(materialFilePrefix)-roughness.png")
        material?.metalness.contents = UIImage(named: "\(materialFilePrefix)-metal.png")
        material?.normal.contents = UIImage(named: "\(materialFilePrefix)-normal.png")
        
//        let sphereNode2 = sphereNode.clone()
//        sphereNode2.position = SCNVector3(x: 0, y: 0, z: -20)
//        scene.rootNode.addChildNode(sphereNode2)
//       
        // Setup background - This will be the beautiful blurred background
        // that assist the user understand the 3D envirnoment
        let bg = UIImage(named: "sphericalBlurred.png")
        scene.background.contents = bg;
        
//        // Setup Image Based Lighting (IBL) map
        let env = UIImage(named: "interior_hdri_29_20150416_1169368110.jpg")
        scene.lightingEnvironment.contents = env
        scene.lightingEnvironment.intensity = 2.0
        
        
        // retrieve the SCNView
        // set the scene to the view
        sceneView.scene = scene
        
        // Notallows the user to manipulate the camera
        sceneView.allowsCameraControl = true
        
        
        /*
         * The following was not a part of my blog post but are pretty easy to understand:
         * To make the Orb cool, we'll add rotation animation to it
         */
//        sphereNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 1, y: 1, z: 1, duration: 10)))
//        sphereNode2.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 1, y: 1, z: 1, duration: 10)))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
//    @IBAction func buttonTapped(sender: UIButton) {
//        print(sphereNode.geometry?.firstMaterial?.diffuse.contents)
//        let material = sphereNode.geometry?.firstMaterial
//        print(material)
//        // Declare that you intend to work in PBR shading mode
//        // Note that this requires iOS 10 and up
//        //        material?.lightingModel = SCNMaterial.LightingModel.physicallyBased
//        
//        // Setup the material maps for your object
////        material?.diffuse.contents = UIImage(named: "IMG_0012.JPG")
//        let materialFilePrefix = materialPrefixes[4]
//        material?.diffuse.contents = UIImage(named: "\(materialFilePrefix)-albedo.png")
//        material?.roughness.contents = UIImage(named: "\(materialFilePrefix)-roughness.png")
//        material?.metalness.contents = UIImage(named: "\(materialFilePrefix)-metal.png")
//        material?.normal.contents = UIImage(named: "\(materialFilePrefix)-normal.png")
//    }
}
