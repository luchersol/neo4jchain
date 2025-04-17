export const BackendAPI = import.meta.env.VITE_BACKEND_API ?? '';

export const transformObject = () => {
	const transformed = {};

	for (const key in entityDict) {
		transformed[key] = [];
		transformed[`List<${key}>`] = [];
	}

	return transformed;
};

export const isEntityOrArray = (str = '') => {
	return str.startsWith('List<') || Object.keys(entityDict).includes(str);
};

export const entityDict = {
	Chain: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		version: { type: 'String', required: true },
		description: { type: 'String', required: true },
		ownershipType: { type: 'OwnershipType', required: true }
	},
	ChainFaceted: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		version: { type: 'String', required: true },
		description: { type: 'String', required: false },
		ownershipType: { type: 'OwnershipType', required: true }
	},
	ChainState: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		version: { type: 'String', required: true },
		description: { type: 'String', required: false },
		ownershipType: { type: 'OwnershipType', required: true },
		initial: { type: 'List<Status>', required: true },
		terminal: { type: 'List<Status>', required: true },
		initialSla: { type: 'Sla', required: true }
	},
	Customer: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		organization: { type: 'Organization', required: true },
		sla: { type: 'Sla', required: true }
	},
	Issue: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		title: { type: 'String', required: true },
		description: { type: 'String', required: true },
		serviceOrg: { type: 'ServiceOrg', required: true },
		status: { type: 'Status', required: true },
		assignedTeam: { type: 'Team', required: false },
		assignedPerson: { type: 'Person', required: false },
		owner: { type: 'Person', required: true },
		requestType: { type: 'RequestType', required: true }
	},
	Objective: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		metric: { type: 'Metric', required: true },
		value: { type: 'Double', required: true },
		unit: { type: 'UnitTime', required: true }
	},
	Organization: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		code: { type: 'String', required: true },
		teams: { type: 'List<Team>', required: true },
		services: { type: 'List<ServiceOrg>', required: true },
		chain: { type: 'Chain', required: true }
	},
	Person: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		lastName: { type: 'String', required: true },
		firstName: { type: 'String', required: true },
		email: { type: 'String', required: true },
		phone: { type: 'String', required: true },
		roles: { type: 'List<Role>', required: true }
	},
	Privilege: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true }
	},
	Provider: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		organization: { type: 'Organization', required: true },
		serviceOrg: { type: 'ServiceOrg', required: true },
		servicesProviders: { type: 'List<ServiceOrg>', required: true },
		sla: { type: 'Sla', required: true }
	},
	RequestType: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true }
	},
	Role: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		privileges: { type: 'List<Privilege>', required: true }
	},
	Scope: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		priority: { type: 'Priority', required: true },
		requestType: { type: 'RequestType', required: true },
		objectives: { type: 'List<Objective>', required: true }
	},
	ServiceOrg: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		description: { type: 'String', required: true },
		status: { type: 'Status', required: true },
		requestTypes: { type: 'List<RequestType>', required: true },
		teams: { type: 'List<Team>', required: true },
		customers: { type: 'List<Customer>', required: true }
	},
	Sla: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		guarantees: { type: 'List<Scope>', required: true }
	},
	Status: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		possibleNextStatuses: { type: 'List<Status>', required: true }
	},
	Team: {
		id: { type: 'Long', required: false },
		name: { type: 'String', required: true },
		specialization: { type: 'String', required: true },
		members: { type: 'List<Person>', required: true },
		roles: { type: 'List<Role>', required: true }
	}
};
