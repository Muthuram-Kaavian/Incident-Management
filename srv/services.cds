using { sap.capire.incidents as my } from '../db/schema';

/**          
 * Service used by support personell, i.e. the incidents' 'processors'.
 * exposes entities
 */
service ProcessorService { 
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers;
}

annotate ProcessorService.Incidents with  @odata.draft.enabled;
annotate ProcessorService with @(requires:'support');

/**
 * Service used by administrators to manage customers and incidents.
 * useful for editing incidents without immediately updating the database
 */

 
service AdminService {
    entity Customers as projection on my.Customers;
    entity Incidents as projection on my.Incidents;   
    }

annotate AdminService with @(requires:'admin');