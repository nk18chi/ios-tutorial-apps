//
//  SceneDelegate.swift
//  Assignment4
//
//  Created by Derrick Park on 4/22/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    // MARK: - TRY TO REFACTOR THE CODE
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    window?.makeKeyAndVisible()
    
    let tabVC = UITabBarController()
    window?.rootViewController = tabVC
    
    // 5 cities
    let vancouver = City(name: "Vancouver", temp: 15, precipitation: 95, icon: "canada", summary: "Rainy")
    let verona = City(name: "Verona", temp: 22, precipitation: 20, icon: "italy", summary: "Cloudy")
    let tokyo = City(name: "Tokyo", temp: 24, precipitation: 40, icon: "japan", summary: "Sunny")
    let saoPaulo = City(name: "Sao Paulo", temp: 32, precipitation: 20, icon: "brazil", summary: "Sunny")
    let seoul = City(name: "Seoul", temp: 35, precipitation: 50, icon: "korea", summary: "Sunny")
    
    let vanVC = CityViewController()
    vanVC.city = vancouver
    vanVC.tabBarItem = UITabBarItem(title: vancouver.name, image: UIImage(named: vancouver.icon), selectedImage: nil)
    let verVC = CityViewController()
    verVC.city = verona
    verVC.tabBarItem = UITabBarItem(title: verona.name, image: UIImage(named: verona.icon), selectedImage: nil)
    let tokVC = CityViewController()
    tokVC.city = tokyo
    tokVC.tabBarItem = UITabBarItem(title: tokyo.name, image: UIImage(named: tokyo.icon), selectedImage: nil)
    let spVC = CityViewController()
    spVC.city = saoPaulo
    spVC.tabBarItem = UITabBarItem(title: saoPaulo.name, image: UIImage(named: saoPaulo.icon), selectedImage: nil)
    let seoulVC = CityViewController()
    seoulVC.city = seoul
    seoulVC.tabBarItem = UITabBarItem(title: seoul.name, image: UIImage(named: seoul.icon), selectedImage: nil)
    let cities = [vanVC, verVC, tokVC, spVC, seoulVC]
    
    tabVC.viewControllers = cities.map { UINavigationController(rootViewController: $0) }
    
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
  }
  
  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }
  
  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }
  
  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }
  
  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }
  
  
}

