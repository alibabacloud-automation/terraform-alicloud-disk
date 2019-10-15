package test

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/random"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()
	uniqueId := random.UniqueId()
	uniqueName := fmt.Sprintf("tf-testAcc%s", uniqueId)
	name := uniqueName
	category := "cloud_efficiency"
	size := "40"
	tags := map[string]string{
		"CreateBy":   "Terraform",
		"CreateFrom": "Modules",
	}
	diskCount := "1"
	encrypted := "true"
	attachDisk := "true"

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "./basic/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name":        name,
			"category":    category,
			"size":        size,
			"tags":        tags,
			"disk_count":  diskCount,
			"encrypted":   encrypted,
			"attach_disk": attachDisk,
			// We also can see how lists and maps translate between terratest and terraform.
		},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	}
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualName := terraform.Output(t, terraformOptions, "this_name")
	actualCategory := terraform.Output(t, terraformOptions, "this_category")
	actualSize := terraform.Output(t, terraformOptions, "this_size")
	actualTags := terraform.OutputMap(t, terraformOptions, "this_tags")
	delete(actualTags, "Name")
	// delete this key here cause the server always add it, but we couldn't check.
	actualDiskCount := terraform.Output(t, terraformOptions, "this_disk_count")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, name, actualName)
	assert.Equal(t, category, actualCategory)
	assert.Equal(t, size, actualSize)
	assert.Equal(t, tags, actualTags)
	assert.Equal(t, diskCount, actualDiskCount)

}
