//import { ValidationAcceptor, ValidationChecks } from 'langium';
//import { AndroidApplicationAstType, Person } from './generated/ast';
import type { AndroidApplicationServices } from './android-application-module';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: AndroidApplicationServices) {
   // const registry = services.validation.ValidationRegistry;
    //const validator = services.validation.AndroidApplicationValidator;
    //const checks: ValidationChecks<AndroidApplicationAstType> = {
        //Person: validator.checkPersonStartsWithCapital
    };
    //registry.register(checks, validator);
//}

/**
 * Implementation of custom validations.
 */
export class AndroidApplicationValidator {

   // checkPersonStartsWithCapital(person: Person, accept: ValidationAcceptor): void {
       // if (person.name) {
           // const firstChar = person.name.substring(0, 1);
           // if (firstChar.toUpperCase() !== firstChar) {
            //    accept('warning', 'Person name should start with a capital.', { node: person, property: 'name' });
           // }
       // }
    //}

}
