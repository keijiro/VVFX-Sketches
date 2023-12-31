using UnityEngine;

[ExecuteInEditMode]
public sealed class MeshFilterClone : MonoBehaviour
{
    [field:SerializeField] MeshFilter Target { get; set; }

    MeshFilter _meshFilter;

    void Update()
    {
        if (_meshFilter == null)
        {
            _meshFilter = gameObject.AddComponent<MeshFilter>();
            _meshFilter.hideFlags = HideFlags.HideAndDontSave;
        }

        if (Target == null) return;

        _meshFilter.sharedMesh = Target.sharedMesh;
    }
}
