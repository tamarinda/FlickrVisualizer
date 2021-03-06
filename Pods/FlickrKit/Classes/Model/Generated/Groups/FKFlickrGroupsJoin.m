//
//  FKFlickrGroupsJoin.m
//  FlickrKit
//
//  Generated by FKAPIBuilder.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrGroupsJoin.h" 

@implementation FKFlickrGroupsJoin



- (BOOL) needsLogin {
    return YES;
}

- (BOOL) needsSigning {
    return YES;
}

- (FKPermission) requiredPerms {
    return 1;
}

- (NSString *) name {
    return @"flickr.groups.join";
}

- (BOOL) isValid:(NSError **)error {
    BOOL valid = YES;
	NSMutableString *errorDescription = [[NSMutableString alloc] initWithString:@"You are missing required params: "];
	if(!self.group_id) {
		valid = NO;
		[errorDescription appendString:@"'group_id', "];
	}

	if(error != NULL) {
		if(!valid) {	
			NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errorDescription};
			*error = [NSError errorWithDomain:FKFlickrKitErrorDomain code:FKErrorInvalidArgs userInfo:userInfo];
		}
	}
    return valid;
}

- (NSDictionary *) args {
    NSMutableDictionary *args = [NSMutableDictionary dictionary];
	if(self.group_id) {
		[args setValue:self.group_id forKey:@"group_id"];
	}
	if(self.accept_rules) {
		[args setValue:self.accept_rules forKey:@"accept_rules"];
	}

    return [args copy];
}

- (NSString *) descriptionForError:(NSInteger)error {
    switch(error) {
		case FKFlickrGroupsJoinError_RequiredArgumentsMissing:
			return @"Required arguments missing";
		case FKFlickrGroupsJoinError_GroupDoesNotExist:
			return @"Group does not exist";
		case FKFlickrGroupsJoinError_GroupNotAvailabieToTheAccount:
			return @"Group not availabie to the account";
		case FKFlickrGroupsJoinError_AccountIsAlreadyInThatGroup:
			return @"Account is already in that group";
		case FKFlickrGroupsJoinError_MembershipInGroupIsByInvitationOnly:
			return @"Membership in group is by invitation only.";
		case FKFlickrGroupsJoinError_UserMustAcceptTheGroupRulesBeforeJoining:
			return @"User must accept the group rules before joining";
		case FKFlickrGroupsJoinError_AccountInMaximumNumberOfGroups:
			return @"Account in maximum number of groups";
		case FKFlickrGroupsJoinError_UserUnableToJoin:
			return @"User unable to join";
		case FKFlickrGroupsJoinError_SSLIsRequired:
			return @"SSL is required";
		case FKFlickrGroupsJoinError_InvalidSignature:
			return @"Invalid signature";
		case FKFlickrGroupsJoinError_MissingSignature:
			return @"Missing signature";
		case FKFlickrGroupsJoinError_LoginFailedOrInvalidAuthToken:
			return @"Login failed / Invalid auth token";
		case FKFlickrGroupsJoinError_UserNotLoggedInOrInsufficientPermissions:
			return @"User not logged in / Insufficient permissions";
		case FKFlickrGroupsJoinError_InvalidAPIKey:
			return @"Invalid API Key";
		case FKFlickrGroupsJoinError_ServiceCurrentlyUnavailable:
			return @"Service currently unavailable";
		case FKFlickrGroupsJoinError_WriteOperationFailed:
			return @"Write operation failed";
		case FKFlickrGroupsJoinError_FormatXXXNotFound:
			return @"Format \"xxx\" not found";
		case FKFlickrGroupsJoinError_MethodXXXNotFound:
			return @"Method \"xxx\" not found";
		case FKFlickrGroupsJoinError_InvalidSOAPEnvelope:
			return @"Invalid SOAP envelope";
		case FKFlickrGroupsJoinError_InvalidXMLRPCMethodCall:
			return @"Invalid XML-RPC Method Call";
		case FKFlickrGroupsJoinError_BadURLFound:
			return @"Bad URL found";
  
		default:
			return @"Unknown error code";
    }
}

@end
