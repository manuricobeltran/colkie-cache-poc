
import Foundation
import Swinject

class ProjectModule: InjectorModule {
    
    override func configure(_ container: Container) {
        configurePersistence(container)
        configureProfile(container)
    }
    
    private func configurePersistence(_ container: Container) {
        container.register(PersistenceController.self) { resolver in
            return PersistenceControllerDefault()
        }
    }
    
    private func configureProfile(_ container: Container) {
        
        container.register(ProfileLocalDataSource.self) { resolver in
            let persistenceController = resolver.resolve(PersistenceController.self)!
            return ProfileLocalDataSource(persistenceController: persistenceController)
        }
        
        container.register(ProfileRepository.self) { resolver in
            let localDataSource = resolver.resolve(ProfileLocalDataSource.self)!
            let remoteDataSource = ProfileRemoteDataSource()
            return ProfileRepositoryDefault(
                localDataSource: localDataSource,
                remoteDataSource: remoteDataSource)
        }
        
        container.register(GetProfileInteractor.self) { resolver in
            let profileRepository = resolver.resolve(ProfileRepository.self)!
            return GetProfileInteractorDefault(profileRepository: profileRepository)
        }
    }
}
