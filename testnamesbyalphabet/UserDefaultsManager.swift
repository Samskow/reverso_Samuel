
//=====================
import Foundation //pour les users default

//=====================

//=====================
class UserDefaultsManager{
    //---------
    func doesKeyExist(theKey:String)->Bool{
        //verifier si il y a une information qui a été sauvegarder
        
        if UserDefaults.standard.object(forKey: theKey) == nil {
            return false
        }
        return true
    }
    //---------
    func setKey(theValue:AnyObject,theKey:String){// keys toujours string
        UserDefaults.standard.set(theValue, forKey: theKey)
        
    }
    //---------
    func removeKey(theKey:String){
        
        UserDefaults.standard.removeObject(forKey: theKey)
        
        
    }
    //---------
    
    func getValue(theKey:String)->AnyObject{
        return UserDefaults.standard.object(forKey: theKey) as AnyObject
        
    }
}
