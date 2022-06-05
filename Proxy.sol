// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;


contract Controlled {
    address public Controller;

    /**
      * The Controlled constructor sets the original `Controller` of the contract to the sender
      * account.
      */
    constructor() public {
        Controller = msg.sender;
    }

    /**
      * Throws if called by any account other than the Controller.
      */
    modifier OnlyController() {
        require(msg.sender == Controller);
        _;
    }

    /**
    * Allows the current controller to transfer control of the contract to a NewController.
    * NewController: The address to transfer ownership to.
    */
    function TransferControl(address NewController) public OnlyController {
        if (NewController != address(0)) {
            Controller = NewController;
        }
    }

}

 /**
    * Main contract VesselIdentifier includes general Identifiers of the veseel such as IMO Code, Flag and Call Sign.
    * Editing data requires Owner level access, which is coming fom Controlled.
    */

contract VesselIdentifier is Controlled {

    string public ImoCode = "10534567";
    
    string public Flag = "Flag not set yet";
    
    function ChangeFlag(string memory _flag) OnlyController public {
        Flag = _flag;
    }
    
    string public CallSign = "Call Sign not set yet";
    
    function ChangeCallSign(string memory _CallSign) OnlyController public {
        CallSign = _CallSign;
    }

    address public VesselDetailsContract = 0x0000000000000000000000000000000000000000;
    
    function ChangeVesselDetailsContract(address _VesselDetailsContract) OnlyController public {
    VesselDetailsContract = _VesselDetailsContract;
    }

   
}
