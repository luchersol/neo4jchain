package com.cbd.neo4jchain.provider;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class ProviderService {

    ProviderRepository providerRepository;

    public ProviderService(ProviderRepository providerRepository) {
        this.providerRepository = providerRepository;
    }

    public Provider getProviderById(Long id) {
        return this.providerRepository.findById(id).orElseThrow();
    }

    public List<Provider> getAllProvider() {
        return this.providerRepository.findAll();
    }

    public Provider createProvider(Provider provider) {
        return this.providerRepository.save(provider);
    }

    public Provider updateProvider(Long providerId, Provider provider) {
        Provider providerToUpdate = getProviderById(providerId);
        BeanUtils.copyProperties(provider, providerToUpdate, "id");
        return this.providerRepository.save(provider);
    }

    public void deleteProvider(Long providerId) {
        if (!this.providerRepository.existsById(providerId))
            throw new NotFoundResource(Provider.class, "ID", providerId);
        this.providerRepository.deleteById(providerId);
    }
}
