@isTest
public class CaptureDocusignTest {
    @isTest 
    static void testDebugDocInfoWithEmptyValues() {
        // Create mock data mimicking the DocuSign response with some fields as empty
        Map<String, Object> mockResponse = new Map<String, Object>{
            'event' => 'envelope-completed',
            'data' => new Map<String, Object>{
                'envelopeSummary' => new Map<String, Object>{
                    'recipients' => new Map<String, Object>{
                        'signers' => new List<Object>{
                            new Map<String, Object>{
                                'email' => 'test@example.com',
                                'tabs' => new Map<String, Object>{
                                    'textTabs' => new List<Object>{
                                        new Map<String, Object>{'tabLabel' => 'DBA Name', 'value' => ''}, // Empty DBA Name
                                        new Map<String, Object>{'tabLabel' => 'Business Name', 'value' => 'Another Test Company'},
                                        new Map<String, Object>{'tabLabel' => 'Amount Requested', 'value' => ''}, // Empty Amount Requested
                                        new Map<String, Object>{'tabLabel' => 'Annual Revenue', 'value' => ''}, // Empty Annual Revenue
                                        new Map<String, Object>{'tabLabel' => 'Federal Tax Id', 'value' => null}, // Null Federal Tax Id
                                        new Map<String, Object>{'tabLabel' => 'Phone Number', 'value' => 'InvalidPhoneNumber'}, // Invalid format
                                        new Map<String, Object>{'tabLabel' => 'Website', 'value' => ''}, // Empty Website
                                        new Map<String, Object>{'tabLabel' => 'Business Start Date', 'value' => null}, // Null Start Date
                                        new Map<String, Object>{'tabLabel' => 'Industry', 'value' => ''}, // Empty Industry
                                        new Map<String, Object>{'tabLabel' => 'Business Address', 'value' => null}, // Null Business Address
                                        new Map<String, Object>{'tabLabel' => 'Use of Proceeds', 'value' => ''}, // Empty Use of Proceeds
                                        new Map<String, Object>{'tabLabel' => 'city', 'value' => 'New York'},
                                        new Map<String, Object>{'tabLabel' => 'state', 'value' => ''}, // Empty State
                                        new Map<String, Object>{'tabLabel' => 'zip', 'value' => '12345'},
                                        new Map<String, Object>{'tabLabel' => 'entity_type', 'value' => null}, // Null Entity Type
                                        new Map<String, Object>{'tabLabel' => 'w2_employees_21_22', 'value' => ''}, // Empty W2 Employees
                                        new Map<String, Object>{'tabLabel' => 'most_important', 'value' => ''}, // Empty Most Important
                                        new Map<String, Object>{'tabLabel' => 'Process Credit Card', 'value' => null}, // Null Process Credit Card
                                        new Map<String, Object>{'tabLabel' => 'Interested', 'value' => ''}, // Empty Interested
                                        new Map<String, Object>{'tabLabel' => 'monthly_cc_processing', 'value' => ''}, // Empty Monthly CC Processing
                                        new Map<String, Object>{'tabLabel' => 'Description of busineess', 'value' => ''}, // Empty Description of Business
                                        new Map<String, Object>{'tabLabel' => 'Owner Name 1', 'value' => ''}, // Empty Owner Name 1
                                        new Map<String, Object>{'tabLabel' => 'Owner Name 2', 'value' => null}, // Null Owner Name 2
                                        new Map<String, Object>{'tabLabel' => 'DOB 1', 'value' => ''}, // Empty DOB 1
                                        new Map<String, Object>{'tabLabel' => 'DOB 2', 'value' => null}, // Null DOB 2
                                        new Map<String, Object>{'tabLabel' => 'SSN 1', 'value' => ''}, // Empty SSN 1
                                        new Map<String, Object>{'tabLabel' => 'SSN 2', 'value' => null}, // Null SSN 2
                                        new Map<String, Object>{'tabLabel' => '% Ownership 1', 'value' => ''}, // Empty Ownership 1
                                        new Map<String, Object>{'tabLabel' => '% Ownership 2', 'value' => null}, // Null Ownership 2
                                        new Map<String, Object>{'tabLabel' => 'Owner Address 1', 'value' => ''}, // Empty Owner Address 1
                                        new Map<String, Object>{'tabLabel' => 'Owner Address 2', 'value' => null}, // Null Owner Address 2
                                        new Map<String, Object>{'tabLabel' => 'Owner City 1', 'value' => ''}, // Empty Owner City 1
                                        new Map<String, Object>{'tabLabel' => 'Owner City 2', 'value' => null}, // Null Owner City 2
                                        new Map<String, Object>{'tabLabel' => 'Owner State 1', 'value' => ''}, // Empty Owner State 1
                                        new Map<String, Object>{'tabLabel' => 'Owner State 2', 'value' => null}, // Null Owner State 2
                                        new Map<String, Object>{'tabLabel' => 'Owner Zip 1', 'value' => ''}, // Empty Owner Zip 1
                                        new Map<String, Object>{'tabLabel' => 'Owner Zip 2', 'value' => null}, // Null Owner Zip 2
                                        new Map<String, Object>{'tabLabel' => 'Owner Phone 1', 'value' => ''}, // Empty Owner Phone 1
                                        new Map<String, Object>{'tabLabel' => 'Owner Phone 2', 'value' => null}, // Null Owner Phone 2
                                        new Map<String, Object>{'tabLabel' => 'Owner email address 1', 'value' => ''}, // Empty Owner Email Address 1
                                        new Map<String, Object>{'tabLabel' => 'Owner email addres 2', 'value' => null}, // Null Owner Email Address 2
                                        new Map<String, Object>{'tabLabel' => 'Owner Credit 1', 'value' => ''}, // Empty Owner Credit 1
                                        new Map<String, Object>{'tabLabel' => 'Owner Credit 2', 'value' => null} // Null Owner Credit 2
                                    }
                                }
                            }
                        }
                    },
                    'envelopeDocuments' => new List<Object>{
                        new Map<String, Object>{
                            'documentId' => '1',
                            'PDFBytes' => EncodingUtil.base64Encode(Blob.valueOf('Test PDF Content'))
                        }
                    }
                }
            }
        };

        // Serialize the mock data to JSON string
        String jsonBody = JSON.serialize(mockResponse);

        // Create a mock RestRequest
        RestRequest req = new RestRequest();
        req.requestBody = Blob.valueOf(jsonBody);

        // Set the mock request in the RestContext
        Test.startTest();
        RestContext.request = req; 
        
        // Call the method under test to handle various empty and null values
        captureDocusign.debugDocInfo(); 
        Test.stopTest();
    }
}
