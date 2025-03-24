export const BackendAPI = import.meta.env.VITE_BACKEND_API ?? '';

export const transformObject = (obj) => {
	const transformed = {};

	for (const key in obj) {
		transformed[key] = [];
		transformed[`List<${key}>`] = [];
	}

	return transformed;
};

export const entityDict = {
	ChainFaceted: {
		id: 'Long',
		name: 'String',
		version: 'String',
		description: 'String',
		ownershipType: 'OwnershipType'
	},
	ChainState: {
		id: 'Long',
		name: 'String',
		version: 'String',
		description: 'String',
		ownershipType: 'OwnershipType',
		initial: 'List<Status>',
		terminal: 'List<Status>',
		initialSla: 'Sla'
	},
	Customer: {
		id: 'Long',
		name: 'String',
		organization: 'Organization',
		sla: 'Sla'
	},
	Issue: {
		id: 'Long',
		name: 'String',
		title: 'String',
		description: 'String',
		serviceOrg: 'ServiceOrg',
		status: 'Status',
		assignedTeam: 'Team',
		assignedPerson: 'Person',
		owner: 'Person',
		requestType: 'RequestType'
	},
	Objective: {
		id: 'Long',
		name: 'String',
		metric: 'Metric',
		value: 'Double',
		unit: 'UnitTime'
	},
	Organization: {
		id: 'Long',
		name: 'String',
		code: 'String',
		parent: 'Organization',
		teams: 'List<Team>',
		services: 'List<ServiceOrg>',
		chain: 'Chain'
	},
	Person: {
		id: 'Long',
		name: 'String',
		lastName: 'String',
		firstName: 'String',
		email: 'String',
		phone: 'String',
		roles: 'List<Role>'
	},
	Privilege: {
		id: 'Long',
		name: 'String'
	},
	Provider: {
		id: 'Long',
		name: 'String',
		organization: 'Organization',
		serviceOrg: 'ServiceOrg',
		servicesProviders: 'List<ServiceOrg>',
		sla: 'Sla'
	},
	RequestType: {
		id: 'Long',
		name: 'String'
	},
	Role: {
		id: 'Long',
		name: 'String',
		privileges: 'List<Privilege>'
	},
	Scope: {
		id: 'Long',
		name: 'String',
		priority: 'Priority',
		requestType: 'RequestType',
		objectives: 'List<Objective>'
	},
	ServiceOrg: {
		id: 'Long',
		name: 'String',
		description: 'String',
		status: 'Status',
		requestTypes: 'List<RequestType>',
		teams: 'List<Team>',
		customers: 'List<Customer>'
	},
	Sla: {
		id: 'Long',
		name: 'String',
		guarantees: 'List<Scope>'
	},
	Status: {
		id: 'Long',
		name: 'String',
		possibleNextStatuses: 'List<Status>'
	},
	Team: {
		id: 'Long',
		name: 'String',
		specialization: 'String',
		members: 'List<Person>',
		roles: 'List<Role>'
	}
};
