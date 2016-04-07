
/*
 +------------------------------------------------------------------------+
 |                       ___  ___ ___ _ __   ___                          |
 |                      / __|/ __/ _ \  _ \ / _ \                         |
 |                      \__ \ (_|  __/ | | |  __/                         |
 |                      |___/\___\___|_| |_|\___|                         |
 |                                                                        |
 +------------------------------------------------------------------------+
 | Copyright (c) 2015-2016 Scene Team (http://mcorce.com)                 |
 +------------------------------------------------------------------------+
 | This source file is subject to the MIT License that is bundled         |
 | with this package in the file docs/LICENSE.txt.                        |
 |                                                                        |
 | If you did not receive a copy of the license and are unable to         |
 | obtain it through the world-wide-web, please send an email             |
 | to scene@mcorce.com so we can send you a copy immediately.             |
 +------------------------------------------------------------------------+
 | Authors: DangCheng <dangcheng@hotmail.com>                             |
 +------------------------------------------------------------------------+
 */

namespace Scene\Validation\Validator;

use Scene\Validation;
use Scene\Validation\Message;
use Scene\Validation\Validator;

/**
 * Scene\Validation\Validator\Identical
 *
 * Checks if a value is identical to other
 *
 *<code>
 * use Scene\Validation\Validator\Identical;
 *
 * $validator->add('terms', new Identical([
 *    'accepted' => 'yes',
 *    'message' => 'Terms and conditions must be accepted'
 * ]));
 *</code>
 *
 */
class Identical extends Validator
{

    /**
     * Executes the validation
     *
     * @param \Scene\Validation validation
     * @param string field
     * @return boolean
     */
    public function validate(<Validation> validation, string! field) -> boolean
    {
        var message, label, replacePairs, value, valid;

        let value = validation->getValue(field);

        if this->hasOption("accepted") {
            let valid = value == this->getOption("accepted");
        } else {
            if this->hasOption("value") {
                let valid = value == this->getOption("value");
            }
        }

        if !valid {

            let label = this->getOption("label");
            if empty label {
                let label = validation->getLabel(field);
            }

            let message = this->getOption("message");
            let replacePairs = [":field": label];
            if empty message {
                let message = validation->getDefaultMessage("Identical");
            }

            validation->appendMessage(new Message(strtr(message, replacePairs), field, "Identical", this->getOption("code")));
            return false;
        }

        return true;
    }
}
