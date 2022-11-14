//
//  ProfileEntityCD+CoreDataClass.swift
//  
//
//  Created by Manu Rico on 7/11/22.
//
//

import Foundation
import CoreData

@objc(ProfileEntityCache)
public class ProfileEntityCache: NSManagedObject {}

extension ProfileEntityCache {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProfileEntityCache> {
        return NSFetchRequest<ProfileEntityCache>(entityName: "ProfileEntityCache")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var typeString: String?

}

extension ProfileEntityCache {
    
    var type: ProfileEntity.UserType {
        ProfileEntity.UserType(rawValue: typeString ?? "") ?? .fan
    }
    
    static func createWith(_ profileEntity: ProfileEntity, using managedObject: NSManagedObjectContext) {
        guard deleteData(using: managedObject) else { return }
        let entity = ProfileEntityCache(context: managedObject)
        entity.id = profileEntity.id
        entity.name = profileEntity.name
        entity.typeString = profileEntity.type.rawValue
        try? managedObject.save()
    }
    
    static func fetchData(using managedObjectContext: NSManagedObjectContext) -> ProfileEntityCache? {
        return (try? managedObjectContext.fetch(fetchRequest()))?.first
    }
    
    private static func deleteData(using managedObjectContext: NSManagedObjectContext) -> Bool {
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest())
        deleteRequest.resultType = .resultTypeStatusOnly
        
        let batchDelete = try? managedObjectContext.execute(deleteRequest) as? NSBatchDeleteResult
        let result = batchDelete?.result as? Bool ?? false
        
        print("-- DELETE BATCH RESULT -- \(result)")
        
        return result
    }
}
