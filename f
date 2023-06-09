actor Administrator
boundary ReactView
control CollaboratorController

entity CollaboratorEntity

Administrator -> ReactView: initiateDeletion(CollaboratorId)
activate ReactView
ReactView -->CollaboratorController :deleteCollaborator(CollaboratorId)
activate CollaboratorController

CollaboratorController -->CollaboratorEntity : getCollaborator(CollaboratorId)
activate CollaboratorEntity
CollaboratorEntity -->CollaboratorController : Collaborator exists
deactivate CollaboratorEntity
alt Collaborator exists
CollaboratorController -->CollaboratorEntity : deleteCollaborator(CollaboratorID)
else Collaborator not found
    CollaboratorController -->Administrator: CollaboratorNotFound
end